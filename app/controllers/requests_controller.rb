class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:patient_id, :description, :media)
  end
end
