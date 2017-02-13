class AddProcedureIdToWorkflows < ActiveRecord::Migration
  def change
    add_column :workflows, :procedure_id, :integer
  end
end
