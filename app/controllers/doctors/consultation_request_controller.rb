class Doctors::ConsultationRequestController < ApplicationController
  def show
  end
  
  def index
    @upcoming_consultation_requests = ConsultationRequest.left_outer_joins(:chat_room).where(chat_rooms: {doctor: current_user.doctor}, chat_rooms: { consultation_request_id: nil })
    @previous_consulation_requests = ConsultationRequest.joins(:chat_room).where(chat_rooms: {doctor: current_user.doctor})
  end 
end
