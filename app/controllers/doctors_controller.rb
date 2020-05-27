class DoctorsController < ApplicationController
  layout 'doctors/doctors'

  before_action :load_doctor

  def dashboard
    @upcoming_consultations =
      ConsultationRequest
      .left_outer_joins(:chat_room)
      .where(directed_to: @doctor, chat_rooms: { consultation_request_id: nil })

    @unanswered_questions =
      Question
      .left_outer_joins(:answer)
      .where(directed_to: @doctor, answers: { question_id: nil })

    @waiting_urgent_request = UrgentRequest.find_by(status: :scheduled)
  end

  def accept_urgent_request
    @urgent_request = UrgentRequest.find_by(id: params[:urgent_request_id])

    if @urgent_request.present?
      @urgent_request.update(status: :in_progress)
      @chat_room = ChatRoom.create(urgent_request: @urgent_request, patient: @urgent_request.patient, doctor: @doctor)

      redirect_to doctor_connect_with_patient_path(
        doctor_id: @doctor.id,
        urgent_request_id: params[:urgent_request_id]
      )

    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def profile
  end

  private

  def load_doctor
    @doctor = Doctor.find_by(user: current_user)
  end
end
