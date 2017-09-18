class AddStatusToWorkflowSteps < ActiveRecord::Migration
  def change
    add_column :workflow_steps, :status, :string
  end
end
