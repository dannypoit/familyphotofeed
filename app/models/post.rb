class Post < ApplicationRecord
  validates :caption, presence: true

  belongs_to :user
end
