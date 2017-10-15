class AddFileToReport < ActiveRecord::Migration[5.1]
  def change
    add_attachment :reports,:file
  end
end
