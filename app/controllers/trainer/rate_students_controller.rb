class Trainer::RateStudentsController < ApplicationController
  before_action :find_course_subject

  def index
    @trainee_subjects = @current_subject.trainee_subjects 
  end
  def update
    current_trainee_subject = TraineeSubject.find_by id: params[:id]
    current_trainee_subject.update_attributes(trainee_subject_params)
    respond_to do |format|
      format.html {redirect_back fallback_location: { action: "index" }}
    end
  end

  private
  def trainee_subject_params
    params.require(:trainee_subject).permit :score , :comment
  end
  def find_course_subject
    @current_subject = Subject.find_by id: params[:subject_id]
    @current_course = Course.find(params[:course_id])
  end
end
