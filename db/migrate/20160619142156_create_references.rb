class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
