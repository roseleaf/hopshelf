class CreateGenre < ActiveRecord::Migration
    def up
      create_table :genre do |t|
        t.text :name
      t.timestamps
    end
  end
  def down
  end
end