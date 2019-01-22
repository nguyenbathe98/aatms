class TraineeQuestion < ApplicationRecord
  belongs_to :trainee_test
  belongs_to :test_question
  has_many :trainee_answers
  has_many :test_answers, through: :trainee_answers
end
