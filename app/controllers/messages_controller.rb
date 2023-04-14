class MessagesController < ApplicationController
  def create
    message = ChatMessage.new(message_params.merge(user: current_user, chat_room: chat_room))

    if message.save
      GPTMessageSenderJob.perform_later(message.body, current_user)
      redirect_to root_path
    else
      render "home/index", locals: {chat_room: chat_room}, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:chat_message).permit(:body)
  end

  def chat_room
    @chat_room ||= User.find_or_create_chat_room_with(current_user)
  end
end
