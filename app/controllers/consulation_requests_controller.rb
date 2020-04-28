class ConsulationRequestsController < RequestsController
  layout 'patients/patients'
  before_action :set_consulation_request, only: [:show, :edit, :update, :destroy]

  def index
    @consulation_requests = ConsulationRequest.where(patient: current_user.patient )
  end

  def show
  end

  def new
    @consulation_request = ConsulationRequest.new(patient: current_user.patient)
  end

  def create
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulation_request
      @consulation_request = ConsulationRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consulation_request_params
      params.require(:consulation_request).permit(:patient_id, :description, :directed_to_id, :scheduled_for, :media)
    end
end
