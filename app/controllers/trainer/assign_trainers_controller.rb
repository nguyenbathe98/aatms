class Trainer::AssignTrainersController < ApplicationController
  before_action :find_course

  def index
  end

  def update
    @course.trainer_ids += params[:trainers][:id]
    redirect_to trainer_course_path(@course)
  end

  def destroy
    delete_trainer = CourseTrainer.find_by id: params[:course_trainer][:id]
    delete_trainer.delete
    redirect_to trainer_course_path(@course)
  end

  private
  def find_course
    @course = Course.friendly.find(params[:course_id])
  end

end
