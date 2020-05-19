class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room, inverse_of: :chat_messages
  has_one_attached :media

  validates_presence_of :user, :chat_room
  validates_length_of :message, maximum: 1000

  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end
end
