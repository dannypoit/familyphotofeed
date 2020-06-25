class NotificationMailer < ApplicationMailer
  default from: 'no-reply@familyphotofeed.com'

  def welcome_email
    mail(to: 'nancypoit@gmail.com',
    subject: 'Welcome to Family Photo Feed (TEST)')
  end
end
