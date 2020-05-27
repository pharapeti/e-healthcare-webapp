class UrgentRequestsController < ApplicationController
  layout 'patients/patients'
  skip_before_action :verify_authenticity_token
  before_action :set_urgent_request, only: %i[show edit update destroy wait_screen check_for_session_start]
  before_action :set_patient

  def index
    @urgent_requests = UrgentRequest.where(patient: @patient)
  end

  def show
  end

  def new
    @urgent_request = UrgentRequest.new
  end

  def create
    @urgent_request = UrgentRequest.new(urgent_request_params)
    @urgent_request.patient = current_user.patient

    respond_to do |format|
      if @urgent_request.save
        format.html do
          redirect_to(
            patient_urgent_request_wait_screen_path(urgent_request_id: @urgent_request),
            notice: 'Urgent Request was successfully created.'
          )
        end
        format.json { render :show, status: :created, location: @urgent_request }
      else
        format.html { render :new }
        format.json { render json: @urgent_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @urgent_request.update(urgent_request_params)
        format.html { redirect_to patient_urgent_request_path(id: @urgent_request), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @urgent_request }
      else
        format.html { render :edit }
        format.json { render json: @urgent_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def wait_screen

  end

  def check_for_session_start
    if @urgent_request.status == 'in_progress'
      @chat_room = ChatRoom.find_by(urgent_request_id: @urgent_request.id)
      if @chat_room.present?
        respond_to do |format|
          format.html { render plain: '' }
          format.json do
            render(
              json: {
                address: patient_connect_with_doctor_path(
                  patient_id: @patient.id,
                  urgent_request_id: @urgent_request.id
                )
              },
              status: :ok
            )
          end
        end
      end
    else
      respond_to do |format|
        format.html { render plain: '' }
        format.json { render json: {}, status: :bad_request }
      end
    end
  end

  def destroy
    @urgent_request.destroy
    respond_to do |format|
      format.html { redirect_to root_path}
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_urgent_request
    @urgent_request = UrgentRequest.find(params[:id].presence || params[:urgent_request_id].presence)

    nil unless @urgent_request.present?
  end

  def set_patient
    @patient = current_user.patient
  end

  # Only allow a list of trusted parameters through.
  def urgent_request_params
    params.require(:urgent_request).permit(:patient_id, :description, :media)
  end
end
