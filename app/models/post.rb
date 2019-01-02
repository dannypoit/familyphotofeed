class Post < ApplicationRecord
  validates :caption, presence: true
  validates :photo, presence: true
  has_many :comments

  mount_uploader :photo, PhotoUploader

  belongs_to :user
end
