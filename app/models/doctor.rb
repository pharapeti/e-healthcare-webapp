class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :practice
  has_many :questions
end
