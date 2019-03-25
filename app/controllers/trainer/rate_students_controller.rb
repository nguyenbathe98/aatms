class Trainer::RateStudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_course_subject

  def index
    @trainee_subjects = @course_subject.trainee_subjects 
  end

  def update
    current_trainee_subject = TraineeSubject.find_by id: params[:trainee_subject_id]
    current_trainee_subject.update_attributes(score: params[:score])
  end

  private
  def trainee_subject_params
    params.require(:trainee_subject).permit :score , :comment
  end

  def find_course_subject
    @current_subject = Subject.find_by id: params[:subject_id]
    @current_course = Course.find(params[:course_id])
    @course_subject = CourseSubject.find_by subject_id: params[:subject_id], course_id: params[:course_id]
  end
end
