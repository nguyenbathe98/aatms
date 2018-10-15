class TraineeTask < ApplicationRecord
  belongs_to :trainee
  belongs_to :task
  belongs_to :course_subject_task
  belongs_to :trainee_subject
  enum status: {pending: 0 ,finish: 1}

  def self.build_trainee_tasks(course_subject)
  	course_subject.trainee_subjects.each do |trainee_subject|
      course_subject.course_subject_tasks.each do |course_subject_task|
        course_subject_task.trainee_tasks.build trainee_id: trainee_subject.trainee.id , course_subject_task_id: course_subject_task.id ,trainee_subject_id: trainee_subject.id, task_id: course_subject_task.task.id
      end
    end
  end
end
