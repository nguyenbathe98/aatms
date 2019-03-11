class Trainee::CoursesController < ApplicationController
  def show
    @course = Course.find params[:id]
    @course_of_trainee = CourseTrainee.find_by trainee_id: current_trainee.id, course_id: @course.id
    @subjects = @course.subjects
    @trainee_of_courses = @course.trainees
    @trainer_of_courses = @course.trainers
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :image)
  end
end
