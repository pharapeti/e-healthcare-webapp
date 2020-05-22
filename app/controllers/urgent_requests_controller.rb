class UrgentRequestsController < ApplicationController
  layout 'patients/patients'
  skip_before_action :verify_authenticity_token
  before_action :set_urgent_request, only: %i[show edit update destroy]
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
        format.html { redirect_to patient_urgent_request_path(id: @urgent_request), notice: 'Urgent Request was successfully created.' }
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

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urgent_request
      @urgent_request = UrgentRequest.find(params[:id])
    end



  def set_patient
    @patient = current_user.patient
  end

    # Only allow a list of trusted parameters through.
    def urgent_request_params
      params.require(:urgent_request).permit(:patient_id, :description, :media)
    end
end
