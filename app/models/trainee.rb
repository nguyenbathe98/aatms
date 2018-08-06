class Trainee < ApplicationRecord
  has_many :course_trainees
  has_many :trainee_tasks
  has_many :trainee_subjects
  has_many :courses,  through: :course_trainees
  has_many :tasks,    through: :trainee_tasks
  has_many :subjects, through: :trainee_subjects
end
