class PatientsController < ApplicationController
  layout 'patients'

  before_action :load_patient

  def dashboard
  end

  def index
  end

  def show
  end

  private

  def load_patient
    @patient = Patient.find_by(user: current_user)
  end
end
