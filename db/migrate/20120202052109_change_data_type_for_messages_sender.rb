class ChangeDataTypeForMessagesSender < ActiveRecord::Migration
  def up
    change_column :messages, :sender, :text
  end

  def down
  end
end
