class Patients::PatientRegistrationController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    binding.pry
  end
end