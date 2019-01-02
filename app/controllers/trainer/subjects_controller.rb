class Trainer::SubjectsController < ApplicationController
  def show
    trainer_course = CourseTrainer.find_by course_id: params[:course_id], trainer_id: current_trainer.id
    redirect_to root_url and return unless trainer_course
    @course = Course.find_by id: trainer_course.course.id
    redirect_to root_url and return unless @course
    @course_subject = CourseSubject.find_by course_id: @course.id, subject_id: params[:id]
    @course_subject.trainee_subjects.each do |ts|
      ts.trainee_tasks.each do |tt|
        @trainee_task = tt
      end
    end
  end
end
