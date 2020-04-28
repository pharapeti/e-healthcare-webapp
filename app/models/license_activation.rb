class LicenseActivation < ApplicationRecord
  validates_presence_of :license_number, :code

  scope :redeemed, -> { where(redeemed: false) }
  scope :valid, -> { where(redeemed: true) }
end
