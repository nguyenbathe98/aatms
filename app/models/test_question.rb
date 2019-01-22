class TestQuestion < ApplicationRecord
  belongs_to :subject
  has_many :test_answers
  has_many :trainee_questions
  has_many :trainee_tests, through: :trainee_questions
  scope :questions_of_subjects, ->subject_ids {where subject_id: subject_ids}
end
