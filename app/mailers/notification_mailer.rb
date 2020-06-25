class NotificationMailer < ApplicationMailer
  default from: 'no-reply@familyphotofeed.com'

  def welcome_email
    mail(to: 'dannypoit@gmail.com',
    subject: 'Welcome to Family Photo Feed')
  end
end
