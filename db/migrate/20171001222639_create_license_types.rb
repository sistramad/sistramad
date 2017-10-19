
class CreateLicenseTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :license_types do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :active
      t.timestamps
    end
  end
end
