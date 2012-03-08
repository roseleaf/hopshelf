class AddPathToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :path, :string
    add_column :genres, :path, :string
  end
end
