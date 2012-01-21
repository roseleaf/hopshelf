class CreateRequestForms < ActiveRecord::Migration
  def change
    create_table :request_forms do |t|

      t.timestamps
    end
  end
end
