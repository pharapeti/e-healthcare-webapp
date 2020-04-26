class Patient < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :requests
end
