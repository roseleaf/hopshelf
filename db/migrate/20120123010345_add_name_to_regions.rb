class AddNameToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :name, :text
    add_column :regions, :res_id, :integer
  end
end
