
class CreateLicenseInfo < ActiveRecord::Migration[5.1]
  def change
    create_table :license_infos do |t|
      t.belongs_to :procedure, index: true
      t.belongs_to :license_type, index:true
      t.belongs_to :license_period, index:true
    end
  end
end
