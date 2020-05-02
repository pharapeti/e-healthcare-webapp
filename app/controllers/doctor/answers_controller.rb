class Doctor::AnswersController < ApplicationController
  layout 'doctors/doctors'
  before_action :load_doctor
  before_action :load_question, only: [:new, :create]

  def index
    @answers = Answer.where(answered_by: @doctor)
    @unanswered_questions = Question.unanswered.where(directed_to: @doctor)
  end

  def show
    @answer = Answer.find_by(id: params[:id])
  end

  def new
    @answer = Answer.new(question: @question, answered_by: @doctor)
  end

  def create
    @answer =
      Answer.new(question: @question, answered_by: @doctor, description: params.to_enum.to_h['answer']['description'])
    if @answer.save!
      respond_to do |format|
        format.html { redirect_to doctor_answer_path(@answer) }
        format.json { render json: {}, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render root_path }
        format.json { render json: { error: 'Could not create answer' }, status: :bad_request }
      end
    end
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

  def load_question
    # Jesus! This is so hacky! I need to fix this ASAP
    question_id =
      if params['answer'].present?
        params.to_enum.to_h['answer']['question_id']&.to_i
      else
        params['question_id']&.to_i
      end

    @question = Question.find_by(id: question_id)

    return if @question.present?

    respond_to do |format|
      format.html { render root_path }
      format.json { render json: { error: 'Could not find question' }, status: :unprocessable_entity }
    end
  end

  def answer_params
    params.permit(:id, :description, :question_id, :authenticity_token, :commit)
  end
end
