class Trainee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable,:trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable
  has_many :course_trainees, dependent: :destroy
  has_many :trainee_tasks, dependent: :destroy
  has_many :trainee_subjects, dependent: :destroy
  has_many :courses,  through: :course_trainees
  has_many :tasks,    through: :trainee_tasks
  has_many :subjects, through: :trainee_subjects
  has_many :course_subject_tasks, through: :trainee_tasks
  scope :trainee_data, -> (course){where.not(id: CourseTrainee.select(:trainee_id).where(course: course))}
  scope :find_trainees, -> (trainee_ids){where(id: trainee_ids)}
end
