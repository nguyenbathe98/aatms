class ApplicationController < ActionController::Base
  #   check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "/public/404.html", :status => 404, :layout => false
  end

  protected
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
  def signed_in?
    if !trainer_signed_in? && !trainee_signed_in?
      redirect_to new_trainee_session_path
    end
  end
end
