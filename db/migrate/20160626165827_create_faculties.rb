
class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties do |t|
      t.string :name, null: false
      t.string :acronym, null: false
      t.boolean :active, null:false, :default => true

      t.timestamps null: false
    end
    add_index :faculties, :name, unique: true
    add_index :faculties, :acronym, unique: true
  end
end
