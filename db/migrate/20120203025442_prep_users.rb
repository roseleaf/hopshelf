class PrepUsers < ActiveRecord::Migration
  def change
    add_column :users, :perishable_token, :string
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_updated_at
  end
end
