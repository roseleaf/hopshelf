class CreateReponseForms < ActiveRecord::Migration
  def change
    create_table :reponse_forms do |t|

      t.timestamps
    end
  end
end
