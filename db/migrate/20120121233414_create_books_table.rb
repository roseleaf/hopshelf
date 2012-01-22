class CreateBooksTable < ActiveRecord::Migration
  def up
    create_table :books do |t|
        t.integer :poster_id
        t.text :title
        t.text :description
        t.text :author
        t.text :genre
      t.timestamps    
    end
  end

  def down
  end
end
