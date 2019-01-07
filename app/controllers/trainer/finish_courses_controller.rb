class Trainer::FinishCoursesController < ApplicationController
  def update
    course = Course.find_by id: params[:course_id]
    if course.start?
      course.build_trainee_subjects
      course.status = 1
      course.save
    elsif course.training?
      course.finish!
      course.course_subjects.each do |course_subject|
        course_subject.finish!
      end
    end
    respond_to do |format|
      format.html {redirect_to trainer_course_path(course.id)}
    end
    
  end
end
