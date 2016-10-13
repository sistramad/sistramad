class Attachment < ActiveRecord::Base
  belongs_to :user
  belongs_to :document
  has_attached_file :file
  validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}


end
