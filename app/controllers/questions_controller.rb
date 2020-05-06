class QuestionsController < ApplicationController
  layout 'patients/patients'
  skip_before_action :verify_authenticity_token
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_patient

  # GET /questions
  # GET /questions.json
  def index
    @unanswered_questions = Question.left_outer_joins(:answer).where(created_by: @patient, answers: { question_id: nil })
    @answered_questions = Question.joins(:answer).where(created_by: @patient)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = @question.answer
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.created_by = current_user.patient
    @question.directed_to = Doctor.find(question_params[:directed_to_id]) if question_params[:directed_to_id]

    respond_to do |format|
      if @question.save
        format.html { redirect_to patient_question_path(id: @question), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to patient_question_path(id: @question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to patient_questions_path, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_patient
    @patient = current_user.patient
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:created_by_id, :directed_to_id, :description, :media)
  end
end
