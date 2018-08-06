class StaticPagesController < ApplicationController
  before_action :signed_in?
	def home
	end
  def index
  end

  private
  def signed_in?
   if !trainee_signed_in?
      redirect_to new_trainee_session_path
   end
end
end
