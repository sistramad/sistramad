class Document < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true

  belongs_to :user
  belongs_to :procedure
end
