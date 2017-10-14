class CreateJointPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :joint_plans do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.integer :status
      t.timestamp :created

      t.timestamps null: false
    end
  end
end
