class Request < ApplicationRecord
  self.abstract_class = true

  belongs_to :patient
  has_one :chat_room
  has_one_attached :media

  validates_presence_of :patient, :status
  enum status: %i[scheduled in_progress finished]
end
