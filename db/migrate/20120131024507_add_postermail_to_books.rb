class AddPostermailToBooks < ActiveRecord::Migration
  def change
    add_column :books, :postermail, :string
    add_column :messages, :to_email, :string
  end
end
