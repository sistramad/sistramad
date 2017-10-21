
class ChangeColunmNameToSteps < ActiveRecord::Migration[5.1]
  def change
     rename_column :steps, :status, :state
  end
end
