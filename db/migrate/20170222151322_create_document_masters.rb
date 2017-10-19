
class CreateDocumentMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :document_masters do |t|
      t.string :name
      t.string :code
      t.string :procedure
      t.boolean :active

      t.timestamps null: false
    end
  end
end
