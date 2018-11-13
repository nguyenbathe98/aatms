class AddCommentToTraineeSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :trainee_subjects, :comment, :string
  end
end
