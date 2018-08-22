class TraineeTask < ApplicationRecord
  belongs_to :trainee
  belongs_to :task
  belongs_to :course_subject_task
  belongs_to :trainee_subject
  enum status: {pending: 0 ,finish: 1}
end
