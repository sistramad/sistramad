class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :user
      t.references :document
      t.references :jointplan
      t.integer :applicant_id

      t.timestamps null: false
    end
  end
end
