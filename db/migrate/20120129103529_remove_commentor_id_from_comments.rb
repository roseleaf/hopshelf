class RemoveCommentorIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentor_id
  end
end
