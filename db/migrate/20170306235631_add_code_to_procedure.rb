class AddCodeToProcedure < ActiveRecord::Migration
  def change
    add_column :procedures, :code, :string
  end
end
