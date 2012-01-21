class CreateResponsePages < ActiveRecord::Migration
  def change
    create_table :response_pages do |t|

      t.timestamps
    end
  end
end
