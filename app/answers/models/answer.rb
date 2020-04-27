class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :answered_by, class_name: 'Doctor', foreign_key: 'answered_by_id'

  validates_presence_of :question, :answered_by
  validates_length_of :description, minimum: 20, maximum: 1000
end
