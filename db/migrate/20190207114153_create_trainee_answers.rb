class CreateTraineeAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainee_answers do |t|
      t.references :trainee_question, foreign_key: true
      t.references :test_answer, foreign_key: true

      t.timestamps
    end
  end
end
