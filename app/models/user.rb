class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :posts
  has_many :comments

  has_friendship

  def friends?
    self.friends
  end

  def friend_requests?
      self.requested_friends.any?
  end

  def requested_friends?
      self.pending_friends.any?
  end

  def invite_friend(user)
      self.friend_request(user)
  end
end
