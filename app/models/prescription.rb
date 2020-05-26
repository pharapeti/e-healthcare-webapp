class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates_presence_of :patient, :doctor, :description
end
