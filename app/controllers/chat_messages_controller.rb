class ChatMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_chat_room

  def create
    @chat_message =
      ChatMessage.create user: current_user, chat_room: @chat_room, message: params.dig(:room_message, :message)
  end

  protected

  def load_chat_room
    @chat_room = ChatRoom.find params.dig(:chat_message, :chat_room_id)
  end
end
