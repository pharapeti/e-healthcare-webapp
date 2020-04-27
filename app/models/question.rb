class Question < ApplicationRecord
  belongs_to :created_by, class_name: 'Patient'
  belongs_to :directed_to, class_name: 'Doctor'
  has_one_attached :media

  validates_presence_of :created_by
  validates_length_of :description, minimum: 5, maximum: 1000
end
