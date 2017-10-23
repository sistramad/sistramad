
class AddStartDateToProcedures < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :start_date, :datetime
    add_column :procedures, :end_date, :datetime
  end
end
