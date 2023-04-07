class CreateJoinTableUsersChatRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :user_chat_rooms do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.belongs_to :chat_room, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
