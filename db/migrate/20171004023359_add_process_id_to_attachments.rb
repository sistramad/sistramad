class AddProcessIdToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :process_id, :integer
  end
end
