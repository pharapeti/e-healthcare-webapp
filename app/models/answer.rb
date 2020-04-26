class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :answered_by

  validates_presence_of :question, :answered_by
end
