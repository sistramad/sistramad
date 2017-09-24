class Participant < ApplicationRecord
  belongs_to :procedure
  belongs_to :user
  validates :procedure_id, uniqueness: { scope: :user_id }
end
