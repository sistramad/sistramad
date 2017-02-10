class AddUserIdToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :user_id, :integer
  end
end
