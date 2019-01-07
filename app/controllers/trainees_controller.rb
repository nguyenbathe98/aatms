class TraineesController < ApplicationController
  before_action :set_trainee

  def finish_signup
    if request.patch? && params[:trainee]
      if @trainee.update(trainee_params)
        sign_in(@trainee, bypass: true)
        redirect_to root_path
      else
        @show_errors = true
      end
    end
  end

  private
  def set_trainee
    @trainee = Trainee.find params[:id]
  end

  def trainee_params
    accessibles = [ :name, :email ]
    accessibles << [ :password, :password_confirmation ] unless params[:trainee][:password].blank?
    params.require(:trainee).permit(accessibles)
  end
end
