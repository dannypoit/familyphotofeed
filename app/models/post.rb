class Post < ApplicationRecord
  validates :caption, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :comments

  def next
    Post.where("id > ?", id).first
  end

  def previous
    Post.where("id < ?", id).last
  end
end
