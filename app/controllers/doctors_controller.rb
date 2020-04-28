class DoctorsController < ApplicationController
  layout 'doctors/doctors'

  before_action :load_doctor

  def dashboard
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    binding.pry
  end

  def profile
  end

  private

  def load_doctor
    @doctor = Doctor.find_by(user: current_user)
  end
end
