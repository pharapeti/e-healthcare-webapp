class StaticController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def index
    if !user_signed_in?
      redirect_to new_user_session_url
    elsif current_user.patient.present?
      handle_patient
    elsif current_user.doctor.present?
      handle_doctor
    end
  end

  private

  def handle_patient
    @patient = current_user.patient
    @active_urgent_request = UrgentRequest.find_by(patient: @patient, status: :in_progress)
    @active_consultation_request = ConsultationRequest.find_by(patient: @patient, status: :in_progress)

    if @active_urgent_request.present?
      redirect_to patient_connect_with_doctor_path(
        patient_id: @patient.id,
        urgent_request_id: @active_urgent_request&.id
      )
    elsif @active_consultation_request.present?
      redirect_to patient_connect_with_doctor_path(
        patient_id: @patient.id,
        consultation_request_id: @active_consultation_request&.id
      )
    else
      redirect_to patient_dashboard_path(@patient)
    end
  end

  def handle_doctor
  end
end
