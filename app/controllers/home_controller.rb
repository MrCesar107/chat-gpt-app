class HomeController < ApplicationController
  def index
    @messages = chat_room.chat_messages.ordered
    render :index, locals: { chat_room: chat_room }
  end

  private

  def chat_room
    @chat_room ||= User.find_or_create_chat_room_with(current_user)
  end
end
