class User < ActiveRecord::Base
  rolify #se pueden agregar opciones a la gema

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :registerable,
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_one :employee, inverse_of: :user

  scope :without_employee, -> { where.not(:id => User.joins(:employee).map(&:id)) }
end
