class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :trainee_subjects
  has_many :course_subject_tasks
end
