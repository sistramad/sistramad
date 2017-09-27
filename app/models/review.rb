class Review < ActiveRecord::Base
  belongs_to :workflow_step
  belongs_to :user
end
