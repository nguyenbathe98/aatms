class Task < ApplicationRecord
  belongs_to :subject
  has_many   :trainee_tasks
  has_many   :trainees, through: :trainee_tasks
end
