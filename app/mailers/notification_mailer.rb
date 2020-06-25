class NotificationMailer < ApplicationMailer
  default from: 'no-reply@familyphotofeed.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
    subject: "Welcome to Family Photo Feed, #{@user.firstname} (TEST)")
  end
end
