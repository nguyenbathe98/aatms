class StaticPagesController < ApplicationController
  before_action :signed_in?

  def home
  	if current_trainee
      current_course = CourseTrainee.find_by trainee_id: current_trainee.id
	  	redirect_to trainee_course_path(current_course) if current_course.pending?
    elsif current_trainer
      trainer = Trainer.find_by id: current_trainer.id
      trainer_courses = trainer.courses
      redirect_to trainer_courses_path
  	end
  end

  private
  def signed_in?
    if !trainee_signed_in? && !trainer_signed_in?
      redirect_to new_trainee_session_path
    end
  end
end
