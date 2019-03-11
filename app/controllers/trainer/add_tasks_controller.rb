class Trainer::AddTasksController < ApplicationController
  before_action :find_course_subject
  def update
    @course_subject_task = CourseSubjectTask.new(add_task_params)
    @course_subject_task.save
    redirect_to trainer_course_subject_path(course.id, params[:subject_id])
  end

  private

  def add_task_params
    params.require(:course_subject_task).permit(:task_name, :task_instruction, :course_subject_id)
  end

  def find_course_subject
    @course = Course.find params[:course_id]
    @course_subject = CourseSubject.find_by course_id: @course.id, subject_id: params[:subject_id]
  end
end
