class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true
  has_many :chat_messages
end
