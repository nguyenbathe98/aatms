class StaticPagesController < ApplicationController
  before_action :signed_in?

  def home
  	current_course = CourseTrainee.find_by trainee_id: current_trainee.id
    redirect_to trainee_course_path(current_course) if current_course.pending?
  end

  private
  def signed_in?
    if !trainee_signed_in? && !trainer_signed_in?
      redirect_to new_trainee_session_path
    end
  end
end
