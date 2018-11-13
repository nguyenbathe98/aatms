class TraineeSubject < ApplicationRecord
  after_update_commit :notify
  belongs_to :trainee
  belongs_to :subject
  belongs_to :course_subject
  belongs_to :course_trainee
  has_many :trainee_tasks, dependent: :destroy
  enum score: {worst:1 , bad: 2, normal: 3, good: 4 , excellent: 5 }
  scope :trainee_subjects_in_course, -> (course){where(course_trainee_id: CourseTrainee.where(course_id: course.id))}
  scope :score_traniee, -> (score){where score: score}

  private
  def notify
    ActiveRecord::Base.transaction do
      new_notification = Notification.create(event: "Supervisor rated #{self.trainee.name} after subject #{self.subject.name}", course_id: self.course_trainee.course.id)
      new_notification_statuses = course_trainee.notification_statuses.build( course_trainee_id: self.course_trainee.id , notification_id: new_notification.id )
      course_trainee.notification_statuses << new_notification_statuses
    end
  end
end
