
class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :capital, null: false
      t.integer :region_id, null: false
      t.integer :sub_region_id, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.string :native_name
      t.string :alpha2code, null: false
      t.string :alpha3code, null: false

      t.timestamps null: false
    end
    add_index :countries, :alpha2code, :unique => true
    add_index :countries, :alpha3code, :unique => true
  end
end
