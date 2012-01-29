class AddCommenterToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenter, :text
  end
end
