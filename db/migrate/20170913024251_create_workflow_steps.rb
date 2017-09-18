class CreateWorkflowSteps < ActiveRecord::Migration
  def change
    create_table :workflow_steps do |t|
      t.string :name
      t.string :description
      t.references :request_workflow, index: true, foreign_key: true
      t.date :approval_date
      t.references :role, index: true, foreign_key: true
      t.text :info
      t.integer :step_number
      t.boolean :is_active
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
