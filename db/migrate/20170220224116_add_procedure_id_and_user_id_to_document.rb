
class AddProcedureIdAndUserIdToDocument < ActiveRecord::Migration[5.1]
  def change
    add_reference :documents, :user, index: true
    add_foreign_key :documents, :users

    add_reference :documents, :procedure, index: true
    add_foreign_key :documents, :procedures
  end
end
