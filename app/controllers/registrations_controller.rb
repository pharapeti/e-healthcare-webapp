class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)

        associate_doctor if session[:doctor_id]
        associate_patient if session[:creating_patient]
        session.delete :doctor_id
        session.delete :creating_patient

        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def associate_doctor
    doctor = Doctor.find_by(id: session[:doctor_id])
    raise 'Doctor does not exist for this user!' unless doctor.present?

    doctor.update!(user: resource)
  end

  def associate_patient
    patient = Patient.new(user: resource)
    raise 'Could not create and associate Patient!' unless patient.save!
  end
end