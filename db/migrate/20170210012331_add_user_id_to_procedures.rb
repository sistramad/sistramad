
class AddUserIdToProcedures < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :user_id, :integer
  end
end
