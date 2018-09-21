class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable,:trackable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable,  :validatable
  has_many :course_trainers
  has_many :courses, through: :course_trainers
  scope :trainer_data , -> (course){where.not(id: CourseTrainer.select(:trainer_id).where(course: course))}
end
