class Patients::PatientRegistrationController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :nuke_doctor_registration_session_var

  def new
    session[:creating_patient] = true
    session.delete :doctor_id
    redirect_to new_user_registration_path
  end

  private

  def nuke_doctor_registration_session_var
    session.delete(:doctor_id)
  end
end