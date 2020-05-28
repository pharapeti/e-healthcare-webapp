class ConsultationRequestsController < ApplicationController
  layout 'patients/patients'
  skip_before_action :verify_authenticity_token
  before_action :set_consultation_request, only: [:show, :edit, :update, :destroy]
  before_action :load_doctor, only: [:create, :update]
  before_action :load_date, only: [:create, :update]

  def index
    @upcoming_consultation_requests = ConsultationRequest.left_outer_joins(:chat_room).where(patient: current_user.patient, chat_rooms: { consultation_request_id: nil })
    @previous_consultation_requests = ConsultationRequest.where(patient: current_user.patient, status: :finished)
  end

  def show
  end

  def new
    @consultation_request = ConsultationRequest.new(patient: current_user.patient)
  end

  def create
    @consultation_request = ConsultationRequest.new(
      description: consultation_request_params['description'],
      patient: current_user.patient,
      directed_to: @doctor,
      scheduled_for: parsed_scheduled_for
    )
    if consultation_request_params['media'].present?
      @consultation_request.media.attach(consultation_request_params['media'])
    end

    if @consultation_request.save!
      respond_to do |format|
        format.html { redirect_to patient_consultation_request_path(id: @consultation_request), notice: 'Booking successful.' }
        format.json { render :show, status: :created, location: @consultation_request }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @consultation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if consultation_request_params['media'].present?
      @consultation_request.media.attach(consultation_request_params['media'])
    end

    if @consultation_request.update!(
      description: consultation_request_params['description'],
      patient: current_user.patient,
      directed_to: @doctor,
      scheduled_for: parsed_scheduled_for
    )
      respond_to do |format|
        format.html { redirect_to patient_consultation_request_path(id: @consultation_request), notice: 'Booking successful.' }
        format.json { render :show, status: :created, location: @consultation_request }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @consultation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    redirect_to patient_consultation_requests_path if @consultation_request.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_consultation_request
    @consultation_request = ConsultationRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def consultation_request_params
    params.require(:consultation_request).permit(:description, :directed_to_id, :scheduled_for, :media)
  end

  def load_doctor
    return unless consultation_request_params['directed_to_id'].present?

    @user = User.find_by(username: consultation_request_params['directed_to_id'])
    raise 'Could not find user' unless @user.present?

    @doctor = Doctor.find_by(user: @user)

    raise 'Could not find doctor' unless @doctor.present?
  end

  def load_date
    dt = parsed_scheduled_for

    raise 'Could not parse date' unless dt.present?

    return unless Time.now + 1.hour > parsed_scheduled_for

    respond_to do |format|
      @consultation_request = ConsultationRequest.new(patient: current_user.patient)
      format.html { render :new }
      format.json { render json: { error: 'You cannot earlier a consultation any ealier than 1 hour' }, status: :unprocessable_entity }
    end
  end

  def parsed_scheduled_for
    return unless consultation_request_params['scheduled_for(1i)'].present?

    DateTime.new(
      consultation_request_params['scheduled_for(1i)'].to_i,
      consultation_request_params['scheduled_for(2i)'].to_i,
      consultation_request_params['scheduled_for(3i)'].to_i,
      consultation_request_params['scheduled_for(4i)'].to_i,
      consultation_request_params['scheduled_for(5i)'].to_i
    )
  end
end
