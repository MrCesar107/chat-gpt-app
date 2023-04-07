class ChatRoom < ApplicationRecord
  has_many :users_chat_rooms, class_name: "UserChatRoom"
  has_many :users, through: :users_chat_rooms
  has_many :chat_messages
end
