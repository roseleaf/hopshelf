class Changeusers < ActiveRecord::Migration
  def up
    add_index :users, :perishable_token  
    add_index :users, :email  
    remove_column :users, :avatar_file_name
  end

  def down
  end
end
