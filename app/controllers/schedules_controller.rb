class SchedulesController < ApplicationController
  before_action :signed_in?
  def index
    @current_course = CourseTrainee.find_by course_id: params[:course_id]
    redirect_to root_url unless @current_course
  end
end
