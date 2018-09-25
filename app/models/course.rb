class Course < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :course_trainees, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :course_trainers, dependent: :destroy
  has_many :trainees,  through: :course_trainees
  has_many :subjects,  through: :course_subjects
  has_many :trainers,  through: :course_trainers
  has_many :schedule
  enum status: {pending: 0 ,finish: 1}
end
