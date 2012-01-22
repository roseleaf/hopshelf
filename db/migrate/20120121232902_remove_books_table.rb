class RemoveBooksTable < ActiveRecord::Migration
  def up
    drop_table :books
  end

  def down
  end
end
