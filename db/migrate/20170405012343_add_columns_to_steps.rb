class AddColumnsToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :steps, :user_view, :string
    add_column :steps, :admin_view, :string

  end
end
