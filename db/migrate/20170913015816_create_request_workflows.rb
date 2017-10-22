class CreateRequestWorkflows < ActiveRecord::Migration
  def change
    create_table :request_workflows do |t|
      t.string :name
      t.string :description
      t.references :professors_transfer, index: true, foreign_key: true
      t.boolean :is_active, default: true
      t.boolean :is_completed, default: false

      t.timestamps null: false
    end
  end
end
