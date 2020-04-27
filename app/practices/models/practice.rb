class Practice < ApplicationRecord
  has_many :doctors

  validates_presence_of :name, :phone, :address
end
