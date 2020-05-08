class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :doctor
  has_one :patient
  has_many :chat_messages

  validate :only_doctor_or_patient
  validates :username, uniqueness: true, presence: true

  private

  def only_doctor_or_patient
    if patient
      errors.add(:base, 'User is a patient and cannot also be a doctor')
    elsif doctor
      errors.add(:base, 'User is a doctor and cannot also be a patient')
    end
  end

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
