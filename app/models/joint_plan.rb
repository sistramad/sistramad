class JointPlan < ActiveRecord::Base
  belongs_to :user, inverse_of: :joint_plan
  accepts_nested_attributes_for :user
  has_many :attachments
  has_many :reports
end
