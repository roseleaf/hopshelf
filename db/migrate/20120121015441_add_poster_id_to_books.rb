class AddPosterIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :poster_id, :integer
  end
end
