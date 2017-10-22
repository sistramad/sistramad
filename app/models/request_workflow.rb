class RequestWorkflow < ActiveRecord::Base
    belongs_to :professors_transfer
    has_many :workflow_step, dependent: :destroy
end
