
class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.references :user, index: {:unique=>true}, foreign_key: true, null: false
      t.integer :type_employee_id, null: false
      t.integer :scale_classification_id, null: false
      t.integer :scale_category_id, null: false

      t.timestamps null: false
    end
  end
end
