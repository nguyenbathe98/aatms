class AddStatusToTraineeAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :trainee_answers, :status, :integer
  end
end
