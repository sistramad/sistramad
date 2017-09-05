class AddTypeOfTranslateToProfessorsTransfers < ActiveRecord::Migration
  def change
    add_column :professors_transfers, :type_of_translate, :integer
  end
end
