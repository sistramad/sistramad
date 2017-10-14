class CreateExtensions < ActiveRecord::Migration[5.1][5.0]
  def change
    create_table :extensions do |t|
      t.references :user, foreign_key: true
      t.references :joint_plan, foreign_key: true
      t.references :attachment, foreign_key: true
      t.boolean :approved
      t.date :new_date

      t.timestamps
    end
  end
end
