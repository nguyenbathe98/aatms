class CourseTrainee < ApplicationRecord
  belongs_to :trainee
  belongs_to :course
  has_many :trainee_subject
  enum status: {pending: 0 ,finish: 1}
end
