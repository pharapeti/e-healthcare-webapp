class ConsultationRequest < Request
  belongs_to :directed_to, class_name: 'Doctor'
  has_one :chat_room, foreign_key: 'consultation_request_id'

  validates_length_of :description, minimum: 5, maximum: 1000
  scope :expired, -> { scheduled_for < Time.now }
end
