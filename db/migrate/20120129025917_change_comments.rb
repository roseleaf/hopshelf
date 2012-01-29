class ChangeComments < ActiveRecord::Migration
  def change 
    rename_column :comments, :poster_id, :commentor_id
  end
end
