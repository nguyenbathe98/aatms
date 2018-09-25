class TraineeSubject < ApplicationRecord
  belongs_to :trainee
  belongs_to :subject
  belongs_to :course_subject
  belongs_to :course_trainee
  has_many :trainee_tasks, dependent: :destroy
end
