class Transcript < ApplicationRecord
  belongs_to :chat_room
  has_many :chat_messages, through: :chat_room
end