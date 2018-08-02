class CourseSubjectTask < ApplicationRecord
  belongs_to :course
  belongs_to :task
  belongs_to :subject
end
