
class AddProceduresidsToRegisteredusers < ActiveRecord::Migration[5.1]
  def change
    add_column :registered_users, :procedure_id, :integer
  end
end
