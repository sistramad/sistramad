class ReferenceList < ApplicationRecord
  belongs_to :reference, inverse_of: :reference_lists

  has_many   :countries_region, :class_name => 'Country', :foreign_key => 'region_id'
  has_many   :countries_sub_region, :class_name => 'Country', :foreign_key => 'sub_region_id'
  has_many   :employees_type, :class_name => 'Employee', :foreign_key => 'type_employee_id'
  has_many   :employees_category, :class_name => 'Employee', :foreign_key => 'scale_category_id'
  has_many   :employees_classification, :class_name => 'Employee', :foreign_key => 'scale_classification_id'

  scope :type_employee, -> { where(:reference_id => ReferenceConstant::TYPE_EMPLOYEE) }
  scope :scale_classification, -> { where(:reference_id => ReferenceConstant::SCALE_CLASSIFICATION) }
  scope :scale_category, -> { where(:reference_id => ReferenceConstant::SCALE_CATEGORY) }
end
