
class AddCodeToProcedure < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :code, :string
  end
end
