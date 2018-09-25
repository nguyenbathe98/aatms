class Trainer::FinishCoursesController < ApplicationController
  def update
    course = Course.find_by id: params[:course_id]
    if course.finish?
      course.pending!
    else
      course.finish!
    end
    redirect_to trainer_course_path(course.id)
  end
end
