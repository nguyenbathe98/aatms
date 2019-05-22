class UserNotifierMailer < ApplicationMailer
  default :from => 'nguyen.ba.the@sun-asterisk.com'
  def send_welcome_mail (trainee)
    @trainee = trainee
    mail( to: @trainee.email, subject: 'Welcome to new course!')
  end
end
