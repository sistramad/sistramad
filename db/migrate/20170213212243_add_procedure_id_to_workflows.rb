
class AddProcedureIdToWorkflows < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :procedure_id, :integer
  end
end
