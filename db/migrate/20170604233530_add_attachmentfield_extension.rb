class AddAttachmentfieldExtension < ActiveRecord::Migration
  def change

    add_attachment :extensions,:file
  end
end
