class PatientsController < ApplicationController
  layout 'patients/patients'

  before_action :load_patient

  def dashboard
    @upcoming_consultations =
      ConsultationRequest
        .left_outer_joins(:chat_room)
        .where(patient: @patient, chat_rooms: { consultation_request_id: nil })

    @unanswered_questions =
      Question
        .left_outer_joins(:answer)
        .where(created_by: @patient, answers: { question_id: nil })
  end

  def index
  end

  def show
  end

  def profile
  end

  def edit
  end

  private

  def load_patient
    @patient = Patient.find_by(user: current_user)
  end
end
