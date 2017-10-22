class FormalitiesDocument < ActiveRecord::Base
  belongs_to :formalities_master
  belongs_to :document
end
