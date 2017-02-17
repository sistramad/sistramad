class CreateFormalitiesMasters < ActiveRecord::Migration
  def change
    create_table :formalities_masters do |t|
      t.string :name
      t.string :description
      t.string :table_manager
      t.boolean :isactive

      t.timestamps null: false
    end
  end
end
