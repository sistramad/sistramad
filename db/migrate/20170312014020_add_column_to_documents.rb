
class AddColumnToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :code, :string
  end
end
