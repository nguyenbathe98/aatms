class TraineeAnswer < ApplicationRecord
  belongs_to :trainee_question
  belongs_to :test_answer
  enum status: {wrong: 0, correct: 1}
  scope :answer_of_trainee,-> (trainee_answer_ids){ where id: trainee_answer_ids }
  scope :score_of_trainee,-> { where status: 1 }
end
