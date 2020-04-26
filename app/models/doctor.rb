class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :practice
  has_many :questions
  has_many :answers
end
