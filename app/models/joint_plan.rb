class JointPlan < ActiveRecord::Base
  belongs_to :user, inverse_of: :JointPlan
end
