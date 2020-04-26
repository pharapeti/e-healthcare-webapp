class ChatRoom < ApplicationRecord
  belongs_to :request
  belongs_to :patient
  belongs_to :doctor
  has_many :chat_messages, dependent: :destroy, inverse_of: :chat_room

  validates_presence_of :request, :patient, :doctor
end
