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
