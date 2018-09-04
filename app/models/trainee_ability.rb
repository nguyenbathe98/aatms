class TraineeAbility
  include CanCan::Ability

  def initialize(trainee)
    can :update, TraneeTask
    can :read, :all
  end
end
