class AddEndPlanToJointPlan < ActiveRecord::Migration[5.1][5.0]
  def change
    add_column :joint_plans,:end_plan, :date
    change_column :joint_plans, :created, :date
    rename_column :joint_plans, :created, :begin_plan

  end
end
