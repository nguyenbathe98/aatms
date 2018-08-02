class Trainer < ApplicationRecord
  has_many :trainer_courses
  has_many :courses, through: :trainer_courses
end
