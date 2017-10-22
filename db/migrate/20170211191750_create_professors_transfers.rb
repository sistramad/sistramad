class CreateProfessorsTransfers < ActiveRecord::Migration
  def change
    create_table :professors_transfers do |t|
      t.string :name
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.boolean :isactive, default: true
      t.boolean :processed, default: false
      t.boolean :isapproved, default: false

      t.timestamps null: false
    end
  end
end
