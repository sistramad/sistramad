class AddDedicationToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :dedication_classification_id, :integer
  end
end
