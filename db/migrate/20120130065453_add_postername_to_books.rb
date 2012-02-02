class AddPosternameToBooks < ActiveRecord::Migration
  def change
    add_column :books, :postername, :text
  end
end
