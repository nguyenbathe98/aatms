class Trainer < ApplicationRecord
  delegate :can?, :cannot?, :to => :ability
  has_many :course_trainers
  has_many :courses, through: :course_trainers

  def ability
    @ability ||= Ability.new(self)
  end
end
