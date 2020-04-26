class Request < ApplicationRecord
  self.abstract_class = true

  belongs_to :patient
  has_many :chat_rooms
  has_one_attached :media
end
