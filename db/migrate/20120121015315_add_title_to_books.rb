class AddTitleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :title, :text
  end
end
