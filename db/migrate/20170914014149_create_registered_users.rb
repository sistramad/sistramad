
class CreateRegisteredUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :registered_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification_number
      t.string :status
      t.boolean :is_active
      t.timestamps null: false
    end
  end
end
