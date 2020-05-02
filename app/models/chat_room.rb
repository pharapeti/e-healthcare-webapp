class ChatRoom < ApplicationRecord
  belongs_to :request
  belongs_to :patient
  belongs_to :doctor
  belongs_to :consultation_request, optional: true, class_name: 'ConsultationRequest', foreign_key: 'consultation_request_id'
  belongs_to :urgent_request, optional: true, class_name: 'UrgentRequest', foreign_key: 'urgent_request_id'
  has_one :transcript
  has_many :chat_messages, dependent: :destroy, inverse_of: :chat_room

  validates_presence_of :request, :patient, :doctor
end
