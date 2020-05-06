class Doctors::DoctorRegistrationController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :validate_licence_activation, only: :create
  before_action :nuke_patient_registration_session_var

  def create
    @doctor = Doctor.new(license_activation_id: @license_activation.id, practice: @license_activation&.practice)
    if @doctor.save!
      @license_activation.update(redeemed: true, redeemed_at: Time.now)
      session[:doctor_id] = @doctor.id
      respond_to do |format|
        format.html { redirect_to new_user_registration_path }
        format.json { render json: @doctor.errors, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def nuke_patient_registration_session_var
    session.delete :creating_patient
  end

  def validate_licence_activation
    @license_activation = LicenseActivation.valid.where(license_number: params[:license_number], code: params[:sign_in_code]).first

    redirect_to root_path, notice: 'Combination is not valid' unless @license_activation.present?
  end

  def doctor_registration_params
    params.permit(:license_number, :sign_in_code)
  end
end