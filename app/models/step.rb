class Step < ApplicationRecord
  belongs_to :workflow
  belongs_to :group
end
