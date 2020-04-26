class UrgentRequestsController < RequestsController
  before_action :set_urgent_request, only: %i[show edit update destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urgent_request
      @urgent_request = UrgentRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def urgent_request_params
      params.require(:urgent_request).permit(:patient_id, :description, :media)
    end
end