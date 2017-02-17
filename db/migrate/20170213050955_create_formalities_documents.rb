class CreateFormalitiesDocuments < ActiveRecord::Migration
  def change
    create_table :formalities_documents do |t|
      t.references :formalities_master, index: true, foreign_key: true
      t.references :document, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
