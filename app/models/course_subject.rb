class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :trainee_subjects, dependent: :destroy
  has_many :course_subject_tasks, dependent: :destroy
  enum status: {start: 0,pending: 1 ,finish: 2}
end
