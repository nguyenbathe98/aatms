class Trainee::CoursesController < ApplicationController
  def show
  	@course_of_trainee = CourseTrainee.find_by trainee_id: current_trainee.id, course_id: params[:id]
    @course = @course_of_trainee.course
    @trainee_of_courses = @course.trainees
    @trainer_of_courses = @course.trainers
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :image)
  end
end
