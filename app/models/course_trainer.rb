class CourseTrainer < ApplicationRecord
	after_create_commit :notify
  belongs_to :trainer
  belongs_to :course

  private
  def notify
  	Notification.create(event: "#{self.trainer.name} was added to course #{self.course.name}" , course_id: self.course.id)
  end
end
