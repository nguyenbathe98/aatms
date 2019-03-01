class HardWorker
  include Sidekiq::Worker

  def perform(course_id, trainee_id)
    course_trainee = CourseTrainee.find_by course_id: course_id, trainee_id: trainee_id
    return unless course_trainee
    destroy_jobs course_id, trainee_id
    new_notification = Notification.create event: I18n.t('workers.hard_worker.end_course_notify'), course_id: course_id
    NotificationStatus.create course_trainee_id: course_trainee.id , notification_id: new_notification.id
  end

  def destroy_jobs course_id, trainee_id
    jobs = Sidekiq::ScheduledSet.new.select do |retri|
      retri.klass == self.class.name && retri.item["args"] == [course_id, trainee_id]
    end
    jobs.each(&:delete)
  end
end
