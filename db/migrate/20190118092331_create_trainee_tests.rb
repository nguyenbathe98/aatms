class CreateTraineeTests < ActiveRecord::Migration[5.2]
  def change
    create_table :trainee_tests do |t|
      t.references :subject, foreign_key: true
      t.references :course_trainee, foreign_key: true

      t.timestamps
    end
  end
end
