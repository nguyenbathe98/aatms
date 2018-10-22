class NotificationsController < ApplicationController
  def index
    course_params = params[:course_id] ? params[:course_id] : params[:id]
    current_course = Course.find_by id: course_params
    current_course_trainee = CourseTrainee.find_by course_id: current_course.id , trainee_id: current_trainee.id
    ActiveRecord::Base.transaction do
      current_course_trainee.notification_statuses.each do |notification_status|
        notification_status.update_attributes!(status: 1)
      end
    end
  end
end
