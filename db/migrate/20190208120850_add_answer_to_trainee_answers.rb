class AddAnswerToTraineeAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :trainee_answers, :answer, :string
  end
end
