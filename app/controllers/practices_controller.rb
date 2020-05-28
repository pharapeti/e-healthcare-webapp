class PracticesController < ApplicationController
  before_action :accept_all_params
  before_action :load_patient

  private

  def accept_all_params
    params.permit!
  end

  def load_patient
    @patient = current_user.patient
  end
end
