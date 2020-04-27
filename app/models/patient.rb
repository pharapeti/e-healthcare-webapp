class Patient < ApplicationRecord
  belongs_to :user
  has_many :questions, foreign_key: 'created_by_id'
  has_many :requests
  has_many :chat_rooms

  validates_presence_of :user
end
