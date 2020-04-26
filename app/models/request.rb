class Request < ApplicationRecord
  self.abstract_class = true

  belongs_to :patient
  has_one_attached :media
end
