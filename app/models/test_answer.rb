class TestAnswer < ApplicationRecord
  belongs_to :test_question
  has_many :trainee_answers
  has_many :trainee_questions, through: :trainee_answers
  enum status: {wrong: 0, correct: 1}
end
