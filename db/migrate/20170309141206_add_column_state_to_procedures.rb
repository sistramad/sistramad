class AddColumnStateToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :state, :string
  end
end
