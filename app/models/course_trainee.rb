class CourseTrainee < ApplicationRecord
	after_create_commit :notify
  after_save :create_trainee_subjects
  belongs_to :trainee
  belongs_to :course
  has_many :trainee_subjects, dependent: :destroy
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

  def create_trainee_subjects
    self.course.course_subjects.each do |course_subject|
      new_trainee_subjects = course_subject.trainee_subjects.build( trainee_id: self.trainee.id, course_trainee_id: self.id, course_subject_id: course_subject.id , subject_id: course_subject.subject.id )
      new_trainee_subjects.save!
    end
  end
end
