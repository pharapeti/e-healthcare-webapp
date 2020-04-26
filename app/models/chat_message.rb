class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room, inverse_of: :chat_messages

  validates_presence_of :user, :chat_room
  validates_length_of :message, maximum: 1000
end
