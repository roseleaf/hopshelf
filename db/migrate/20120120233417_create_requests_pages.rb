class CreateRequestsPages < ActiveRecord::Migration
  def change
    create_table :requests_pages do |t|

      t.timestamps
    end
  end
end
