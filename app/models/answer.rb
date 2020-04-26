class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :answered_by
end
