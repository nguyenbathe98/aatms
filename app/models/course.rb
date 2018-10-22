class Course < ApplicationRecord
  after_update_commit :notify
  mount_uploader :image, ImageUploader
  has_many :notifications , dependent: :destroy
  has_many :course_trainees, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :course_trainers, dependent: :destroy
  has_many :trainees,  through: :course_trainees
  has_many :subjects,  through: :course_subjects
  has_many :trainers,  through: :course_trainers
  has_many :notifications
  has_many :schedule
  enum status: {start: 0 ,training: 1, finish:2}

  scope :training_course, -> {where status: 1}
  private
  def notify
    ActiveRecord::Base.transaction do
      new_notification = Notification.create(event: "Course #{self.name} was been #{self.status}" , course_id: self.id)
      self.course_trainees.each do |course_trainee|
        new_notification_statuses = course_trainee.notification_statuses.build( course_trainee_id: course_trainee.id , notification_id: new_notification.id )
        new_notification_statuses.save
      end
    end
  end
end
