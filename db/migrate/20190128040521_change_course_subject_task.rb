class ChangeCourseSubjectTask < ActiveRecord::Migration[5.2]
  def change
    change_column_null :course_subject_tasks, :task_id, true
  end
end
