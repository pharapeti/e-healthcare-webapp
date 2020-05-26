class Transcript < ApplicationRecord
  belongs_to :chat_room
  has_many :chat_messages, through: :chat_room
  has_one :request, through: :chat_room

  validates_uniqueness_of :chat_room
end
