class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.string :name
      t.text :description
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
