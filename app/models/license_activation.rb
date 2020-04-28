class LicenseActivation < ApplicationRecord
  has_one :doctor

  validates_presence_of :license_number, :code

  scope :redeemed, -> { where(redeemed: true) }
  scope :valid, -> { where(redeemed: false) }
end
