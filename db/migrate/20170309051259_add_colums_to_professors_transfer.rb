class AddColumsToProfessorsTransfer < ActiveRecord::Migration
  def change
  	add_column :professors_transfers, :faculty_from_id, :integer
  	add_column :professors_transfers, :faculty_to_id, :integer
  end
end
