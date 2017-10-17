class AddTypeToDocument < ActiveRecord::Migration[5.1]
  def change
    add_column :jointplan_documents, :typedoc, :integer
  end
end
