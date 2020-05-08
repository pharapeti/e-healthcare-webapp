class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    chat_room = ChatRoom.find params[:chat_room]
    stream_for chat_room
  end
end