
class AddGroupReferenceToSteps < ActiveRecord::Migration[5.1]
  def change
    add_reference :steps, :group, foreign_key: true
  end
end
