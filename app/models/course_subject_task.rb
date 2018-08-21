class CourseSubjectTask < ApplicationRecord
  belongs_to :course
  belongs_to :task
  belongs_to :subject
  belongs_to :course_subject
  has_many :trainee_tasks
end
