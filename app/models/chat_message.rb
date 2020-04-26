class ChatMessage < ApplicationRecord
  belongs_to :chat_room, inverse_of: :chat_messages
  belongs_to :sent_by
end
