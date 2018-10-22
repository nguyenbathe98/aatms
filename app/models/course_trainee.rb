class CourseTrainee < ApplicationRecord
	after_create_commit :notify
  belongs_to :trainee
  belongs_to :course
  has_many :trainee_subject, dependent: :destroy
  has_many :notification_statuses, dependent: :destroy

  private
  def notify
    ActiveRecord::Base.transaction do
    	new_notification = Notification.create(event: "#{self.trainee.name} was added to course #{self.course.name}" , course_id: self.course.id)
      self.course.course_trainees.each do |course_trainee|
        new_notification_statuses = course_trainee.notification_statuses.build( course_trainee_id: course_trainee.id , notification_id: new_notification.id )
        new_notification_statuses.save
      end
    end
  end
end
