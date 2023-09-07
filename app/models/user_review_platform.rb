class UserReviewPlatform < ApplicationRecord
  belongs_to :user
  belongs_to :review_platform
  has_many :reviews, dependent: :destroy

  validates :review_platform, presence: true
end
