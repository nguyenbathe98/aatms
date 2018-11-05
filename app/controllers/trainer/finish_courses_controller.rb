class Trainer::FinishCoursesController < ApplicationController
  def update
    course = Course.find_by id: params[:course_id]
    if course.start?
      course.training!
      course.course_trainees.each do |course_trainee|
        course.course_subjects.each do |course_subject|
          TraineeSubject.create trainee_id: course_trainee.trainee.id, subject_id: course_subject.subject.id , course_trainee_id: course_trainee.id, course_subject_id: course_subject.id
        end
      end
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
