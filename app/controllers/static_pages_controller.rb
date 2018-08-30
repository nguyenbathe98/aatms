class StaticPagesController < ApplicationController
  skip_authorization_check
  before_action :signed_in?
	def home
	end
  def index
  end

end
