class PatientChatRoomsController < PatientsController
  before_action :accept_all_params
  before_action :load_chat_room, only: %i[show send_transcript]

  # This action creates a chat_room associated to the request the user is navigating from
  def connect_with_doctor
    unless params[:urgent_request_id].present? || params[:consultation_request_id].present?
      redirect_to root_path
    end

    if params[:urgent_request_id].present?
      handle_urgent_request
    elsif params[:consultation_request_id].present?
      handle_consultation_request
    end
  end

  def create
  end

  def send_transcript
    @transcript = Transcript.find_by(chat_room: @chat_room)
    @transcript = Transcript.create(chat_room: @chat_room) if @transcript.blank?

    TranscriptMailer.with(transcript: @transcript).chat_transcript.deliver_now

    render json: {}, status: :ok
  end

  def end_session
    @chat_room = ChatRoom.find(params[:chat_room_id])
    associated_request = @chat_room.urgent_request.presence || @chat_room.consultation_request
    associated_request.update(status: :finished)

    ActionCable.server.broadcast "chat_room_channel_#{@chat_room.id}", action: 'end_session'
    redirect_to root_path
  end

  private

  def handle_urgent_request
    urgent_request = UrgentRequest.find_by(id: params[:urgent_request_id])
    # Need to check if it is in progress; if so we should just redirect the user
    # back to the homepage and say that the consultation is over
    @chat_room = ChatRoom.find_or_create_by(patient: @patient, urgent_request: urgent_request)
    set_up_chat_room

    render 'patient_chat_rooms/show'
  end

  def handle_consultation_request
    consultation_request = ConsultationRequest.find_by(id: params[:consultation_request_id])
    # same as above
    @chat_room = ChatRoom.find_or_create_by(
      consultation_request: consultation_request,
      patient: @patient,
      doctor: consultation_request.directed_to
    )
    set_up_chat_room

    render 'patient_chat_rooms/show'
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
