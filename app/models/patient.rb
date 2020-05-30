class Patient < ApplicationRecord
  belongs_to :user, optional: true
  has_many :questions, foreign_key: 'created_by_id'
  has_many :requests
  has_many :chat_rooms
  has_many :prescriptions

  def name
    user.username
  end

  def in_session?
    @active_urgent_request = UrgentRequest.find_by(patient: self, status: :in_progress)
    @active_consultation_request = ConsultationRequest.find_by(patient: self, status: :in_progress)

    @active_urgent_request.present? || @active_consultation_request.present?
  end

  def current_session_path
    @active_urgent_request = UrgentRequest.find_by(patient: self, status: :in_progress)
    @active_consultation_request = ConsultationRequest.find_by(patient: self, status: :in_progress)

    if @active_urgent_request.present?
      Rails.application.routes.url_helpers.patient_connect_with_doctor_path(
        patient_id: id,
        urgent_request_id: @active_urgent_request&.id
      )
    elsif @active_consultation_request.present?
      Rails.application.routes.url_helpers.patient_connect_with_doctor_path(
        patient_id: id,
        consultation_request_id: @active_consultation_request&.id
      )
    end
  end
end
