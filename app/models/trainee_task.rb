class TraineeTask < ApplicationRecord
  after_update_commit :notify
  belongs_to :trainee
  belongs_to :task, optional: true
  belongs_to :course_subject_task
  belongs_to :trainee_subject
  enum status: {pending: 0 ,finish: 1}
  scope :checked_task,->  (trainee_task_ids){ where id: trainee_task_ids}
  scope :update_status, -> { update status: 1 }

  private
  def notify
    ActiveRecord::Base.transaction do
      new_notification = Notification.create(event: "#{self.trainee.name} #{self.status} task #{self.task.name}" , course_id: self.trainee_subject.course_trainee.course.id)
      self.trainee_subject.course_trainee.course.course_trainees.each do |course_trainee|
        new_notification_statuses = course_trainee.notification_statuses.build( course_trainee_id: course_trainee.id , notification_id: new_notification.id )
        course_trainee.notification_statuses << new_notification_statuses
      end
    end
  end

  def self.build_trainee_tasks(course_subject)
    course_subject.trainee_subjects.each do |trainee_subject|
      course_subject.course_subject_tasks.each do |course_subject_task|
        new_trainee_task = course_subject_task.trainee_tasks.build trainee_id: trainee_subject.trainee.id , course_subject_task_id: course_subject_task.id ,trainee_subject_id: trainee_subject.id, task_id: course_subject_task.task.id
        course_subject_task.trainee_tasks << new_trainee_task
      end
    end
  end
end
