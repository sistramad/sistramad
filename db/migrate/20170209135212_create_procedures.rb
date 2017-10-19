
class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
