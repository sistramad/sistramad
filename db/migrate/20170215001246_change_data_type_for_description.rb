class ChangeDataTypeForDescription < ActiveRecord::Migration
  def self.up
    change_table :formalities_masters do |t|
      t.change :description, :string
    end
  end
  def self.down
    change_table :formalities_masters do |t|
      t.change :description, :text
    end
  end
end
