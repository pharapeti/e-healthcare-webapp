class Doctor < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :practice
  belongs_to :license_activation
  has_many :questions, foreign_key: 'directed_to_id'
  has_many :answers, foreign_key: 'answered_by_id'
  has_many :chat_rooms
  has_many :prescriptions

  validates_presence_of :practice, :license_activation

  def name
    user.username
  end

  def in_session?
    @active_urgent_request =
      ChatRoom.joins(:urgent_request).where(doctor: self, urgent_requests: { status: %i[scheduled in_progress] })

    @active_consultation_request = ConsultationRequest.find_by(directed_to: self, status: :in_progress)

    @active_urgent_request.present? || @active_consultation_request.present?
  end

  def current_session_path
    @active_urgent_request =
      ChatRoom.joins(:urgent_request).where(doctor: self, urgent_requests: { status: %i[scheduled in_progress] })

    @active_consultation_request = ConsultationRequest.find_by(directed_to: self, status: :in_progress)

    if @active_urgent_request.present?
      Rails.application.routes.url_helpers.doctor_connect_with_patient_path(
        doctor_id: id,
        urgent_request_id: @active_urgent_request.first.urgent_request&.id
      )
    elsif @active_consultation_request.present?
      Rails.application.routes.url_helpers.doctor_connect_with_patient_path(
        doctor_id: id,
        consultation_request_id: @active_consultation_request&.id
      )
    end
  end
end
