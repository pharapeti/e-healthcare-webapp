class ConsulationRequestsController < RequestsController
  before_action :set_consulation_request, only: [:show, :edit, :update, :destroy]

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
