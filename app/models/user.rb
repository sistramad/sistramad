class User < ActiveRecord::Base
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login, :avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h

  rolify #se pueden agregar opciones a la gema

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable,
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_one :employee, inverse_of: :user
  has_many :procedures, dependent: :destroy
  has_many :workflows, through: :procedures
  has_many :steps, through: :workflows
  has_many :documents
  has_many :user_groups
  has_many :groups, through: :user_groups

  mount_uploader :avatar, AvatarUploader
  crop_uploaded :avatar

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :identification_document, :numericality => { only_integer: true, allow_nil: true }

  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  scope :without_employee, -> { where.not(:id => User.joins(:employee).map(&:id)) }

  def self.find_asuntos_profesorales_members
    User.joins(:groups).where(groups: {name: "Direción de asuntos profesorales"})
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup #copia con el metodo .dup a conditions
    if login = conditions.delete(:login) #se elimina del hash conditions el login y se asigna el valor a login
      where(conditions.to_hash).where(["username = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
