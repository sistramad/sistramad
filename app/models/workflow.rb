class Workflow < ActiveRecord::Base
  belongs_to :procedure
  has_many :steps
end
