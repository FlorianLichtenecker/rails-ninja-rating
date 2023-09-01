class ReviewPlatform < ApplicationRecord
  has_many :reports
  has_many :reviews, through: :user_review_platforms
end
