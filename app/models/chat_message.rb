class ChatMessage < ApplicationRecord
  after_create_commit :update_messages_frame

  belongs_to :user, optional: true
  belongs_to :chat_room

  def update_messages_frame
    broadcast_append_to :messages, target: "messages-panel", partial: "partials/message", locals: { message: self, current_user: user }
  end
end
