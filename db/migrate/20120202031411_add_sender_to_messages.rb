class AddSenderToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :sender, :text
  end
end
