class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :comment
      t.boolean :files_reviewed
      t.boolean :approval
      t.references :workflow_step, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
