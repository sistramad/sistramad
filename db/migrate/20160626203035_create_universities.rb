
class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :acronym
      t.references :country, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
