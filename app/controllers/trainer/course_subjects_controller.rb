class Trainer::CourseSubjectsController < ApplicationController
  before_action :find_course

  def update
    course_subject = CourseSubject.find_by id: params[:course][:course_subject_id]
    if params[:course][:subject_status] == "start"
      course_subject.pending!
    elsif params[:course][:subject_status] == "pending"
      course_subject.finish! 
    else
      course_subject.start!
    end
    redirect_to trainer_course_path(@course)
  end

  private
  def find_course
    @course = Course.find_by id: params[:id] 
  end
end
