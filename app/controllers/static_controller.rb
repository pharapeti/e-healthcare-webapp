class StaticController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def index
    if !user_signed_in?
      redirect_to new_user_session_url
    elsif current_user.patient.present?
      redirect_to patient_dashboard_path(current_user.patient)
    elsif current_user.doctor.present?
      redirect_to doctors_dashboard_path
    end
  end
end
