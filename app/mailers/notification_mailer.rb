class NotificationMailer < ApplicationMailer
  default from: 'no-reply@familyphotofeed.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
    subject: "Welcome to Family Photo Feed, #{@user.firstname} (TEST)")
  end

  def new_family_post_email(post)
    @post = post
    @user = @post.user
    @friends = @post.user.friends
    @friends.each do |friend|
      @friend = friend
      mail(to: @friend.email,
      subject: "#{@user.firstname} #{@post.user.lastname[0]}. has uploaded a new photo - Family Photo Feed (TEST)")
    end
  end
end
