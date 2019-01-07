class CourseSubject < ApplicationRecord
	after_update_commit :notify
  belongs_to :course
  belongs_to :subject 
  has_many :trainee_subjects, dependent: :destroy 
  has_many :course_subject_tasks, dependent: :destroy , autosave: true
  enum status: {start: 0,pending: 1 ,finish: 2}

  private
  def notify
    ActiveRecord::Base.transaction do
      new_notification = Notification.create(event: "Supervisor #{self.status} subject #{self.subject.name}" , course_id: self.course.id)
      self.course.course_trainees.each do |course_trainee|
        new_notification_statuses = course_trainee.notification_statuses.build( course_trainee_id: course_trainee.id , notification_id: new_notification.id )
        course_trainee.notification_statuses << new_notification_statuses
      end
    end
  end
end
