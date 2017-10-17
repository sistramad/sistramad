class JointplanDocument < ActiveRecord::Base

  has_many :attachments
  accepts_nested_attributes_for :attachments
end
