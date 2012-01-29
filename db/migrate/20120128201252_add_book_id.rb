class AddBookId < ActiveRecord::Migration
  def change
    add_column :messages, :book_id, :integer
  end
end
