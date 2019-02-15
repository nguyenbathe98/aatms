class CourseSubjectTask < ApplicationRecord
  belongs_to :task
  belongs_to :course_subject
  has_many :trainee_tasks, dependent: :destroy , autosave: true
  has_many :trainees , through: :trainee_tasks
  def self.build_course_subject_tasks(course_subject)
    course_subject.subject.tasks.each do |task|
      new_course_subject_task = task.course_subject_tasks.build task_id: task.id, course_subject_id: course_subject.id
      course_subject.course_subject_tasks << new_course_subject_task
    end
	end
end
