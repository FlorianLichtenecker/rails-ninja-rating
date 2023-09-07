class ReviewPlatform < ApplicationRecord
  has_many :reports
  has_many :reviews, through: :user_review_platforms

  scope :exclude_user_review_platforms, lambda { |user|
    where.not(id: user.user_review_platforms.pluck(:review_platform_id))
  }
end
