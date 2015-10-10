class CreateRailschatrooms < ActiveRecord::Migration
  def change
    create_table :railschatrooms do |t|
      t.string :name
      t.integer :user_id
      t.integer :chat_id

      t.timestamps null: false
    end
  end
end
