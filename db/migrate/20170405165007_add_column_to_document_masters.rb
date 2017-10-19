
class AddColumnToDocumentMasters < ActiveRecord::Migration[5.1]
  def change
    add_column :document_masters, :initially_required, :boolean
  end
end
