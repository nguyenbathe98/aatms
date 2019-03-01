class TraineeTest < ApplicationRecord
  belongs_to :subject
  belongs_to :course_trainee
  has_many :trainee_questions
  has_many :test_questions, through: :trainee_questions
  # default_scope -> { order(created_at: :desc) }
  accepts_nested_attributes_for :trainee_questions
end
