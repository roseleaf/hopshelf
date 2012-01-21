class AddAuthorToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author, :text
  end
end
