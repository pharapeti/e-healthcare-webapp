class DoctorChatRoomsController < DoctorsController
  before_action :accept_all_params
  before_action :load_chat_room, only: [:show]

  # This action creates a chat_room associated to the request the user is navigating from
  def connect_with_patient
    redirect_to root_path unless params[:urgent_request_id].present? || params[:consultation_request_id].present?

    if params[:urgent_request_id].present?
      handle_urgent_request
    elsif params[:consultation_request_id].present?
      handle_consultation_request
    end
  end

  def create
  end

  private

  def handle_urgent_request
    urgent_request = UrgentRequest.find_by(id: params[:urgent_request_id])
    # Need to check if it is in progress; if so we should just redirect the user
    # back to the homepage and say that the consultation is over
    @chat_room = ChatRoom.find_or_create_by(doctor: @doctor, urgent_request: urgent_request)
    set_up_chat_room

    render 'doctor_chat_rooms/show'
  end

  def handle_consultation_request
    consultation_request = ConsultationRequest.find_by(id: params[:consultation_request_id])
    # same as above
    @chat_room = ChatRoom.find_or_create_by(
      consultation_request: consultation_request,
      patient: consultation_request.patient,
      doctor: @doctor
    )
    set_up_chat_room

    render 'doctor_chat_rooms/show'
  end

  def set_up_chat_room
    @chat_room.request.update!(status: :in_progress)
    @chat_message = ChatMessage.new chat_room: @chat_room
    @chat_messages = @chat_room.chat_messages.includes(:user)
  end

  def load_chat_room
    @chat_room = ChatRoom.find(params[:id]) if params[:id]
  end

  def accept_all_params
    params.permit!
  end
end
