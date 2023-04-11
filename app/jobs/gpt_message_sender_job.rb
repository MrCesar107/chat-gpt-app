class GPTMessageSenderJob < ApplicationJob
  queue_as :default

  def perform(message, current_user)
    response = GPTMessageSender.new(message).send
    response_message = response.dig("choices", 0, "message", "content")
    ChatMessage.create!(body: response_message, chat_room: current_user.chat_rooms.last)
  end

  class GPTMessageSender
    class Error < StandardError; end

    def initialize(message)
      @message = message
    end

    def send
      api_key = Rails.application.credentials.dig(:openai, :api_key)

      begin
        RubyAI::Client.new(api_key, message).call
      rescue
        raise Error.new("Error sending message to GPT")
      end
    end

    private

    attr_reader :message
  end
end
