class CourseTrainee < ApplicationRecord
  belongs_to :trainee
  belongs_to :course
  has_many :trainee_subject
end
