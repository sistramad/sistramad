class ChangeColunmNameToSteps < ActiveRecord::Migration[5.0]
  def change
     rename_column :steps, :status, :state
  end
end
