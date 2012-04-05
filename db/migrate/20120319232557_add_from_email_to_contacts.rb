class AddFromEmailToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :from_email, :string
    remove_column :contacts, :contactor_id
  end
end
