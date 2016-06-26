class EmployeeFaculties < ActiveRecord::Migration
  def change
    create_table(:employees_faculties, :id => false) do |t|
      t.references :employee, null: false
      t.references :faculty, null:false
    end
    add_index :employees_faculties, [:employee_id, :faculty_id], unique: true
  end
end
