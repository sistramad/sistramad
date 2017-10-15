class Workflow < ApplicationRecord
  belongs_to :procedure
  has_many :steps, dependent: :destroy
end
