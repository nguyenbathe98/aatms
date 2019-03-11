class Trainer::SubjectsController < ApplicationController
  def show
    @course = Course.friendly.find(params[:course_id])
    redirect_to root_url and return unless @course
    trainer_course = CourseTrainer.find_by course_id: @course.id, trainer_id: current_trainer.id
    redirect_to root_url and return unless trainer_course
    @course_subject = CourseSubject.find_by course_id: @course.id, subject_id: params[:id]
    @course_subject.trainee_subjects.each do |ts|
      ts.trainee_tasks.each do |tt|
        @trainee_task = tt
      end
    end
  end
end
