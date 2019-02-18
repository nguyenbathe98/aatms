class CourseSubjectTask < ApplicationRecord
  after_create_commit :build_trainee_task
  belongs_to :task, optional: true
  belongs_to :course_subject
  has_many :trainee_tasks, dependent: :destroy , autosave: true
  has_many :trainees , through: :trainee_tasks

  def self.build_course_subject_tasks(course_subject)
    course_subject.subject.tasks.each do |task|
      new_course_subject_task = task.course_subject_tasks.build task_id: task.id, course_subject_id: course_subject.id
      course_subject.course_subject_tasks << new_course_subject_task
      task.course_subject_tasks.build task_id: task.id, course_subject_id: course_subject.id
    end
	end

  def build_trainee_task
    self.course_subject.trainee_subjects.each do |trainee_subject|
      TraineeTask.create trainee_id: trainee_subject.trainee.id, trainee_subject_id: trainee_subject.id, course_subject_task_id: self.id
    end
  end
end
