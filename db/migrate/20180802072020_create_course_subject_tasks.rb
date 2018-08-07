class CreateCourseSubjectTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subject_tasks do |t|
      t.references :course_subject, foreign_key: true
      t.references :task, foreign_key: true
      t.string :task_name
      t.text :task_instruction

      t.timestamps
    end
  end
end
