class Request < ApplicationController
  belongs_to :patient
  has_one_attached :media
end