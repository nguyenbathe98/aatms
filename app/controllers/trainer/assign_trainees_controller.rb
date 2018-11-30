class Trainer::AssignTraineesController < ApplicationController
  before_action :find_course

  def index
  end

  def update
    @course.trainee_ids += params[:trainees][:id]
    redirect_to trainer_course_path(@course)
  end

  def destroy
    delete_trainee = CourseTrainee.find_by id: params[:course_trainee][:id]
    delete_trainee.destroy
    redirect_to trainer_course_path(@course)
  end

  private
  def find_course
    @course = Course.find_by id: params[:id]
  end

end
