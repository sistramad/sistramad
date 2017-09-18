class RegisteredUser < ApplicationRecord
  belongs_to :procedure
  validates :first_name, :last_name, :identification_number, presence: true
end
