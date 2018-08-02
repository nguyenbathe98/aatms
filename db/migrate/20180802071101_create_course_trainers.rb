class CreateCourseTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :course_trainers do |t|
      t.references :trainer, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
