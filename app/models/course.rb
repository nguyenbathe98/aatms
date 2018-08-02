class Course < ApplicationRecord
  has_many :course_trainees
  has_many :course_subjects
  has_many :course_trainers
  has_many :trainees,  through: :course_trainees
  has_many :subjects,  through: :course_subjects
  has_many :trainers,  through: :course_trainers
  has_many :schedules	
end
