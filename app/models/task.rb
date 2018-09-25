class Task < ApplicationRecord
  belongs_to :subject
  has_many	 :course_subject_tasks, dependent: :destroy
  has_many   :trainee_tasks, dependent: :destroy
  has_many   :trainees, through: :trainee_tasks
end
