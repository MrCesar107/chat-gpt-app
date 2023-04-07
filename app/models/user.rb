class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_chat_rooms, class_name: "UserChatRoom"
  has_many :chat_rooms, through: :users_chat_rooms
  has_many :chat_messages

  def self.find_or_create_chat_room_with(user)
    chat_room = user.chat_rooms.find do |chat_room|
      chat_room.users.include?(user)
    end

    return chat_room if chat_room.present?

    chat_room = ChatRoom.create
    chat_room.users << [user]
    chat_room
  end
end
