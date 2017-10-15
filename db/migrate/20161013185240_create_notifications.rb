class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, polymorphic:true , index: true
      t.boolean :viewed, default: false

      t.timestamps null: false
    end
  end
end
