class AddProcessTypeToProfessorsTransfer < ActiveRecord::Migration
  def change
    add_column :professors_transfers, :process_type, :integer
  end
end
