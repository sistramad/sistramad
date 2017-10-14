class AddAttachmentfieldExtension < ActiveRecord::Migration[5.1]
  def change

    add_attachment :extensions,:file
  end
end
