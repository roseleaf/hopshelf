class DropMessageColumns < ActiveRecord::Migration
  def up
    remove_column :messages, :sender
    remove_column :messages, :receiver
    remove_column :messages, :to_email
  end

  def down
    add_column :messages, :sender, :text
    add_column :messages, :receiver, :text
    add_column :messages, :to_email, :string
  end
end
