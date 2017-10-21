
class AddColumnStateToProcedures < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :state, :string
  end
end
