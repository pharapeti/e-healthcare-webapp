class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room, inverse_of: :chat_messages
end
