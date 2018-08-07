class CourseSubjectTask < ApplicationRecord
  belongs_to :task
  belongs_to :course_subject
  has_many :trainee_tasks
  has_many :trainees , through: :trainee_tasks
end
