class ChatMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_chat_room
  before_action :check_message

  def create
    @chat_message =
      ChatMessage.create user: current_user, chat_room: @chat_room, message: params["chat_message"]
    respond_to do |format|
      format.html do
        redirect_to patient_connect_with_doctor_path(
          patient_id: current_user.patient&.id,
          consultation_request_id: @chat_room.request&.id
        )
      end
      format.json { render json: {}, status: :ok }
    end
  end

  protected

  def load_chat_room
    @chat_room = ChatRoom.find params["chat_room_id"]
  end

  def check_message
    return unless params["chat_message"].blank?

    respond_to do |format|
      format.html { return} # shouldn't return here, we should do something useful
      format.json { render json: { error: 'Message cannot be empty' }, status: :bad_request }
    end
  end
end
