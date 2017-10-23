
class CreateLicensePeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :license_periods do |t|
      t.string :code
      t.string :name
      t.string :description
      t.integer :days
      t.integer :months
      t.integer :years
      t.boolean :active
      t.timestamps
    end
  end
end
