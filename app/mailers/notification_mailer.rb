class NotificationMailer < ApplicationMailer
  default from: 'no-reply@familyphotofeed.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
    subject: "Welcome to Family Photo Feed")
  end

  def self.send_incoming_request_email(friend, user)
    incoming_request_email(friend, user).deliver
  end

  def incoming_request_email(friend, user)
    @friend = friend
    @user = user
    mail(to: @friend.email,
    subject: "#{user.firstname} #{@user.lastname[0]}. has invited you to join their family on Family Photo Feed (TEST)")
  end

  def self.send_accepted_request_email(user, friend)
    accepted_request_email(user, friend).deliver
  end

  def accepted_request_email(user, friend)
    @user = user
    @friend = friend
    mail(to: @friend.email,
    subject: "#{user.firstname} #{@user.lastname[0]}. has accepted your invitation to join their family on Family Photo Feed (TEST)")
  end

  def self.send_new_family_post_email(post)
    @friends = post.user.friends
    @friends.each do |friend|
      new_family_post_email(friend, post).deliver
    end
  end

  def new_family_post_email(friend, post)
    @post = post
    @user = @post.user
    @friend = friend
    mail(to: @friend.email,
    subject: "#{@user.firstname} #{@user.lastname[0]}. has uploaded a new photo to Family Photo Feed (TEST)")
  end
end
