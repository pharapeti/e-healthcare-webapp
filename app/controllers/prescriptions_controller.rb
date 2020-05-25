class PrescriptionsController < ApplicationController
  before_action :accept_all_params

  def create
    @prescription =
      Prescription.new(
        description: params['description'],
        doctor: Doctor.find(params['prescription']['doctor_id'].to_i),
        patient: Patient.find(params['prescription']['patient_id'].to_i)
      )

    if @prescription.save
      respond_to do |format|
        format.html { render plain: 'help' } # shouldn't return here, we should do something useful
        format.json { render json: {}, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render plain: 'help' } # shouldn't return here, we should do something useful
        format.json { render json: { errors: 'Could not save Prescription' }, status: :bad_request }
      end
    end
  end

  private

  def accept_all_params
    params.permit!
  end
end
