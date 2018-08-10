class TraineeAbility
  include CanCan::Ability

  def initialize(trainee)
    trainee ||= Trainee.new
    if trainee.admin == false
      can :read, :all
    end
  end
end