class CreateCourseTrainees < ActiveRecord::Migration[5.2]
  def change
    create_table :course_trainees do |t|
      t.references :trainee, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :status
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps
    end
  end
end
