class CourseTrainer < ApplicationRecord
  belongs_to :trainer
  belongs_to :course
end
