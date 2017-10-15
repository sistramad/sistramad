class CreateJoinplanDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :joinplan_documents do |t|
      t.string :name
      t.integer :status

      t.timestamps null: false
    end
  end
end
