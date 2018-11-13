class AddScoreToTraineeSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :trainee_subjects, :score, :integer
  end
end
