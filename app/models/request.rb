class Request < ApplicationRecord
  self.abstract_class = true

  belongs_to :patient
  has_many :chat_rooms
  has_one_attached :media

  validates_presence_of :patient

  scope :upcoming, -> { scheduled_for > Time.now }
  scope :past, -> { scheduled_for < Time.now }
end
