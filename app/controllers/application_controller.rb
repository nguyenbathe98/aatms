class ApplicationController < ActionController::Base
  #rescue_from CanCan::AccessDenied do |exception|
   # render :file => "/public/404.html", :status => 404, :layout => false
  #end

  private
    #def current_trainee
      #@current_trainee ||= Trainee.find(session[:trainee_id]) if session[:trainee_id]
    #end

    #def current_ability
     # current_trainee.ability
    #end
  def signed_in?
    if !trainee_signed_in?
      redirect_to new_trainee_session_path
   end
  end
end
