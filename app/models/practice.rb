class Practice < ApplicationRecord
  has_many :doctors
  has_many :license_activations

  validates_presence_of :name, :phone, :address
end
