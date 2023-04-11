class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.references :chat_room, null: false, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
