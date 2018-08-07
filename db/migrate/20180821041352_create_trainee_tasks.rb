class CreateTraineeTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :trainee_tasks do |t|
      t.integer :status ,null: false, default: 0
      t.references :trainee, foreign_key: true
      t.references :course_subject_task, foreign_key: true
      t.references :trainee_subject, foreign_key: true
      t.references :task , foreign_key: true

      t.timestamps
 
    end
  end
end
