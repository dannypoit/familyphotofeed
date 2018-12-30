class Post < ApplicationRecord
  validates :caption, presence: true

  mount_uploader :photo, PhotoUploader

  belongs_to :user
end
