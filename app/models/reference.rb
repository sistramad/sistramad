class Reference < ActiveRecord::Base
  has_many  :reference_lists, inverse_of: :reference
end
