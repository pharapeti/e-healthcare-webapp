class ConsultationRequestsController < RequestsController
  layout 'patients/patients'
  before_action :set_consultation_request, only: [:show, :edit, :update, :destroy]

  def index
    @consultation_requests = ConsultationRequest.where(patient: current_user.patient )
  end

  def show
  end

  def new
    @consultation_request = ConsultationRequest.new(patient: current_user.patient)
  end

  def create
    @consultation_request = ConsultationRequest.new(consultation_request_params)
    @consultation_request.patient = current_user.patient

    respond_to do |format|
      if @consultation_request.save
        format.html { redirect_to @consultation_request, notice: 'Booking successful.' }
        format.json { render :show, status: :created, location: @consultation_request }
      else
        format.html { render :new }
        format.json { render json: @consultation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation_request
      @consultation_request = ConsultationRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consultation_request_params
      params.require(:consultation_request).permit(:description, :directed_to_id, :scheduled_for, :media)
    end
end
