class ConsulationRequest < Request
  belongs_to :directed_to

  scope :expired, -> { scheduled_for < Time.now }
end
