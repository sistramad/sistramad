class Country < ApplicationRecord
  belongs_to  :region, :class_name => 'ReferenceList'
  belongs_to  :sub_region, :class_name => 'ReferenceList'
end
