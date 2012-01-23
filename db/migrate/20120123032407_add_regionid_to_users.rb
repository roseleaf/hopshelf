class AddRegionidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :region_id, :text
  end
end
