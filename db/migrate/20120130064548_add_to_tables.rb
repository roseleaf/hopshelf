class AddToTables < ActiveRecord::Migration
  def change
    add_column :messages, :receiver, :text
    add_column :comments, :commentable_name, :text
  
  end

end
