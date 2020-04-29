class ConsultationRequest < Request
  belongs_to :directed_to

  validates_length_of :description, minimum: 5, maximum: 1000
  scope :expired, -> { scheduled_for < Time.now }
end
