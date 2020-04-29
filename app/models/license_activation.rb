class LicenseActivation < ApplicationRecord
  has_one :doctor
  belongs_to :practice

  validates_presence_of :license_number, :code, :practice_id

  scope :redeemed, -> { where(redeemed: true) }
  scope :valid, -> { where(redeemed: false) }
end
