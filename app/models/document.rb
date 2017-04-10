class Document < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true
  validates :name, uniqueness: { scope: :procedure_id }

  belongs_to :user
  belongs_to :procedure
end
