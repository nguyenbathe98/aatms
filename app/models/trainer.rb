class Trainer < ApplicationRecord
  has_many :course_trainers
  has_many :courses, through: :course_trainers
end
