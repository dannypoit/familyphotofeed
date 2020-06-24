class Comment < ApplicationRecord
  validates :message, presence: true, length: { minimum: 1, maximum: 240 }

  belongs_to :post
  belongs_to :user
end
