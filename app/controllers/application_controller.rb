class ApplicationController < ActionController::Base
  before_action :signed_in?
  #   check_authorization :unless => :devise_controller?
  # rescue_from CanCan::AccessDenied do |exception|
  #   render :file => "/public/404.html", :status => 404, :layout => false
  # end

  private
    # def current_trainee
    #   super
    #   @current_trainee ||= Trainee.find(session[:trainee_id]) if session[:trainee_id]
    # end

    # def current_trainer
    #   super
    #   @current_trainer ||= Trainer.find(session[:trainer_id]) if session[:trainer_id]
    # end

    def current_ability
      @current_ability ||= current_trainer ? TrainerAbility.new(current_trainer) : TraineeAbility.new(current_trainee)
    end
end
