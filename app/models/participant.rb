class Participant < ApplicationRecord
  belongs_to :procedure
  belongs_to :user
end
