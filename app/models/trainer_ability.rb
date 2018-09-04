class TrainerAbility
  include CanCan::Ability

  def initialize(trainer)
    can :manage, Trainee 
    can :manage, Course
  end
end
