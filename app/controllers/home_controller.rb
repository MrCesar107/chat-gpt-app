class HomeController < ApplicationController
  def index
    @messages = [current_user_messages, other_user_messages].flatten.sort_by(&:created_at)
    render :index, locals: { chat_room: chat_room }
  end

  private

  def chat_room
    @chat_room ||= User.find_or_create_chat_room_with(current_user)
  end

  def current_user_messages
    @current_user_messages ||= chat_room.chat_messages.where(user: current_user)
  end

  def other_user_messages
    @other_user_messages ||= chat_room.chat_messages.where.not(user: current_user)
  end
end
