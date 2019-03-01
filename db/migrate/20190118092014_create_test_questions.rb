class CreateTestQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :test_questions do |t|
      t.references :subject, foreign_key: true
      t.string :question

      t.timestamps
    end
  end
end
