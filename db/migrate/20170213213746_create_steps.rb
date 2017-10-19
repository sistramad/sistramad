
class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :name
      t.string :description
      t.string :status
      t.boolean :is_active
      t.references :workflow, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
