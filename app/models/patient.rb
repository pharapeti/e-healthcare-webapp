class Patient < ApplicationRecord
  belongs_to :user, optional: true
  has_many :questions, foreign_key: 'created_by_id'
  has_many :requests
  has_many :chat_rooms
  has_many :prescriptions

  def name
    user.username
  end
end
