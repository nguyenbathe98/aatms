class Trainer < ApplicationRecord
  delegate :can?, :cannot?, :to => :ability
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable,:trackable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable,  :validatable
  has_many :course_trainers
  has_many :courses, through: :course_trainers

  def ability
    @ability ||= Ability.new(self)
  end
end
