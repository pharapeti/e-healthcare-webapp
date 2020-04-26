class Question < ApplicationRecord
  belongs_to :created_by, class_name: 'Patient'
  belongs_to :directed_to, class_name: 'Doctor'
  has_one_attached :media
end
