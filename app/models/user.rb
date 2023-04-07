class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_chat_rooms, class_name: "UserChatRoom"
  has_many :chat_rooms, through: :users_chat_rooms
  has_many :chat_messages
end
