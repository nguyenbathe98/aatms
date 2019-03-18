class NotificationStatus < ApplicationRecord
  after_create_commit :notification_broadcast_job
  belongs_to :notification
  belongs_to :course_trainee
  enum status: {unread: 0, readed: 1}

  private
  def notification_broadcast_job
    if Trainee.current
      current_course_trainee = CourseTrainee.find_by trainee_id: Trainee.current.id , course_id: self.notification.course.id
      NotificationBroadcastJob.perform_later(current_course_trainee.notification_statuses.unread.count,self.notification)
    else
      NotificationBroadcastJob.perform_later(Notification.count,self.notification)
    end
  end
end
