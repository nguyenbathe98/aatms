class Trainee::SubjectsController < ApplicationController
  before_action :signed_in?
  def show
    current_course = CourseTrainee.find_by course_id: params[:course_id], trainee_id: current_trainee.id
    redirect_to root_url and return unless current_course
    @current_subject = TraineeSubject.find_by course_trainee_id: current_course.id , subject_id: params[:id]
    redirect_to root_url and return unless @current_subject
    @tasks_of_subject = @current_subject.trainee_tasks
    @finish_tasks = @tasks_of_subject.select{|f| f.status== "finish"}
  end
end
