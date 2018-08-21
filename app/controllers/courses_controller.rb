class CoursesController < ApplicationController
  before_action :signed_in?
  def show
    trainee_course = CourseTrainee.find_by course_id: params[:id] , trainee_id:  current_trainee.id
    @course = Course.find_by id: trainee_course.id
    redirect_to root_url unless @course 
  end
end
