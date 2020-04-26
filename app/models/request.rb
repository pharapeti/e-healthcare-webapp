class Request < ApplicationRecord
  belongs_to :patient
  has_one_attachment :media
end
