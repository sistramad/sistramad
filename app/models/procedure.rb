class Procedure < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  has_many :workflows, dependent: :destroy
  has_many :steps, through: :workflows
  has_many :documents , dependent: :destroy
  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => :all_blank

  def requirements_approved?
    puts name
    puts code
    true
  end
  
end
