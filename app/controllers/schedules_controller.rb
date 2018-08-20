class SchedulesController < ApplicationController
  before_action :signed_in?
  def index
    @course = Course.find_by id: params[:course_id]
    @schedules = @course.schedules
  end
end
