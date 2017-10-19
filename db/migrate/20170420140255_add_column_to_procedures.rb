
class AddColumnToProcedures < ActiveRecord::Migration[5.1]
  def change
     add_column :procedures, :parent_procedure_id, :integer
  end
end
