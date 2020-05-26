class Doctors::ConsultationRequestController < DoctorsController
  def show; end

  def index
    @upcoming_consultation_requests =
      ConsultationRequest
      .left_outer_joins(:chat_room)
      .where(chat_rooms: { doctor: current_user.doctor, consultation_request_id: nil })

    @previous_consulation_requests =
      ConsultationRequest
      .joins(:chat_room)
      .where(chat_rooms: { doctor: current_user.doctor} )
  end
end
