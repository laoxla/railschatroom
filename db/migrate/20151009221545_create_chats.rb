class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :railschatroom_id
      t.date :posted_at
      t.string :text

      t.timestamps null: false
    end
  end
end
