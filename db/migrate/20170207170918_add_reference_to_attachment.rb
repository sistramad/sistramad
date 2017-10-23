class AddReferenceToAttachment < ActiveRecord::Migration[5.1]
  def change
    add_reference :attachments, :joint_plan, index: true, foreign_key: true
  end
end
