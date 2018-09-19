class Trainee::CoursesController < ApplicationController
  before_action :signed_in?
  def show
  	course_of_trainee = CourseTrainee.find_by trainee_id: current_trainee.id
    @courses = course_of_trainee.course
    @course_subjects = CourseSubject.where course_id: course_of_trainee.id
    @trainee_of_courses = @courses.trainees
    @trainer_of_courses = @courses.trainers
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :image)
  end
end
