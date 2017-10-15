class Extension < ApplicationRecord
  belongs_to :user
  belongs_to :joint_plan

  has_attached_file :file , :default_url => '/uploads'
  validates_attachment :file, :content_type => {:content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  validates :file, :presence => true
end
