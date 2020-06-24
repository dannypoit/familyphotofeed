class Post < ApplicationRecord
  validates :caption, presence: true, length: { minimum: 1, maximum: 120 }
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :comments
end