class ConsulationRequest < Request
  scope :expired, -> { scheduled_for < Time.now }
end
