
class AddColumnToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :info, :text
  end
end
