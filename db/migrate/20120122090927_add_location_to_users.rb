class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :region, :text
    add_column :users, :location, :text
    add_column :users, :personal, :text
    add_column :users, :goodtime, :text
  end
end
