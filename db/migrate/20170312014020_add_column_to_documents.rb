class AddColumnToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :code, :string
  end
end
