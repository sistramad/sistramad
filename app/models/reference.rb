class Reference < ApplicationRecord
  has_many  :reference_lists, inverse_of: :reference
end
