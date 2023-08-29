class UsersController < ApplicationController
  def dashboard
    review_platform_ids = UserReviewPlatform.where(user_id: current_user.id).pluck(:review_platform_id)
    @review_platforms = ReviewPlatform.where(id: review_platform_ids)
  end
end
