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
end
