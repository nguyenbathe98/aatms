class Trainer::SubjectsController < ApplicationController
  def show
    trainer_course = CourseTrainer.find_by course_id: params[:course_id], trainer_id: current_trainer.id
    redirect_to root_url and return unless trainer_course
    @course = Course.find_by id: trainer_course.course.id
    redirect_to root_url and return unless @course 
    @course_subject = CourseSubject.find_by course_id: @course.id, subject_id: params[:id] 
  end
end
