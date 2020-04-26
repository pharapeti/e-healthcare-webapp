class Question < ApplicationRecord
  belongs_to :created_by
  belongs_to :directed_to
  has_one_attached :media
end
