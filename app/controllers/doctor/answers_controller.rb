class Doctor::AnswersController < ApplicationController
  layout 'doctors/doctors'
  before_action :load_doctor

  def index
    @answers = Answer.where(answered_by: @doctor)
  end

  def show
    @answer = Answer.find_by(id: answer_params[:id])
  end

  private

  def load_doctor
    @doctor = current_user.doctor

    return if @doctor.present?

    respond_to do |format|
      format.html { render root_path }
      format.json { render json: { error: 'Could not load doctor' }, status: :unprocessable_entity }
    end
  end

  def answer_params
    params.permit(:id)
  end
end