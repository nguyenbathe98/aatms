class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :trainee_subjects, dependent: :destroy
  has_many :course_subject_tasks, dependent: :destroy
end
