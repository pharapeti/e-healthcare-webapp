class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :practice
  belongs_to :license_activation
  has_many :questions, foreign_key: 'directed_to_id'
  has_many :answers, foreign_key: 'answered_by_id'
  has_many :chat_rooms

  validates_presence_of :practice, :license_activation
end
