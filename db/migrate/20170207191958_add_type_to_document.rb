class AddTypeToDocument < ActiveRecord::Migration[5.1]
  def change
    add_column :joinplan_documents, :typedoc, :integer
  end
end
