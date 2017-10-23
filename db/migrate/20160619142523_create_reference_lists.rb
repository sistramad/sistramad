
class CreateReferenceLists < ActiveRecord::Migration[5.1]
  def change
    create_table :reference_lists do |t|
      t.string :name, null: false
      t.text :description
      t.string :value
      t.references :reference, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
