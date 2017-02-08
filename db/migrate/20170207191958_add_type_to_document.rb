class AddTypeToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :typedoc, :integer
  end
end
