class UrgentRequest < Request
  validates_length_of :description, minimum: 5, maximum: 1000
end
