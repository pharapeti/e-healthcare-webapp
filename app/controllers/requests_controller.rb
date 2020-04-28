class RequestsController < ApplicationController
  layout 'patients/patients'

  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_patient

  private

  def set_patient
    @patient = current_user.patient
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:patient_id, :description, :media)
  end
end
