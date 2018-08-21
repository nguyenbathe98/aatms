class Subject < ApplicationRecord
  has_many :tasks
  has_many :trainee_subjects
  has_many :course_subjects
  has_many :course_subject_tasks, through: :course_subjects
  has_many :schedules
  has_many :trainees, through: :trainee_subjects
  has_many :courses,  through: :course_subjects
end
