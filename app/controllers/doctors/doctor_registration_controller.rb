class Doctors::DoctorRegistrationController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :validate_licence_activation, on: :create

  def new
    @doctor = Doctor.new
    #redirect_to root_path, notice: 'Doctor created'
  end

  def create
    @doctor = @license_activation.doctors.build


    respond_to do |format|
      format.html { render :new }
      format.json { render json: { error: 'Combination is not valid' }, status: :unprocessable_entity }
    end
  end

  private

  def validate_licence_activation
    @license_activation = LicenseActivation.valid.where(license_number: params[:license_number], code: params[:code])

    redirect_to root_path, notice: 'Combination is not valid' if @license_activation.exists?
      User.
    else
      flash[:error] = 'Combination is not valid'

      respond_to do |format|
        format.html { render :new }
        format.json { render json: { error: 'Combination is not valid' }, status: :unprocessable_entity }
      end
    end
  end

  def doctor_registration_params
    params.permit(:license_number, :code)
  end
end