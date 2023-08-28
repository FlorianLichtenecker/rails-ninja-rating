class UserReviewPlatform < ApplicationRecord
  belongs_to :user
  belongs_to :review_platform
end
