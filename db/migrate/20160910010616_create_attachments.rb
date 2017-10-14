class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.references :user
      t.references :document
      t.string :link

      t.timestamps null: false
    end
  end
end
