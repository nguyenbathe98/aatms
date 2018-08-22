class SubjectsController < ApplicationController
  before_action :signed_in?
  def show
    current_course = CourseTrainee.find(params[:course_id])
    @current_subject = TraineeSubject.find_by course_trainee_id: current_course.id , subject_id: params[:id]
    redirect_to root_url unless @current_subject
    @tasks_of_subject = @current_subject.trainee_tasks
    @finish_tasks = @tasks_of_subject.select{|f| f.status== "finish"}
  end
end

