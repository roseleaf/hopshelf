class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :text
      t.integer :senderId
      t.integer :receiverId
      t.text :plan

      t.timestamps
    end
  end
end
