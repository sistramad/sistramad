class AddDedicationStartToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :dedication_start_date, :date
  end
end
