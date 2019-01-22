class AddScoreToTraineeTests < ActiveRecord::Migration[5.2]
  def change
    add_column :trainee_tests, :score, :integer
  end
end
