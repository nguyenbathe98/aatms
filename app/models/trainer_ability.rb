class TrainerAbility
  include CanCan::Ability

  def initialize(trainer)
    can :dashboard
    can :access, :rails_admin
    can :manage, Trainee
    can :manage, Course
  end
end
