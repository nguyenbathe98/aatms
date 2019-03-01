class StartCourseNotifierMailer < ApplicationMailer
  include SendGrid
  def send_mail_after_start_course user, password
    mail to: user.email, subject: t(".Course_will_start_now")
  end
end
