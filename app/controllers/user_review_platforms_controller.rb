class UserReviewPlatformsController < ApplicationController
  def create
    @user_review_platform = UserReviewPlatform.new(user_review_platform_params)
    @user_review_platform.user = current_user
    # Access the selected ReviewPlatform ID from params
    review_platform_id = params[:user_review_platform][:review_platform_id]

    # Assign the selected ReviewPlatform ID to the new UserReviewPlatform
    # @user_review_platform.review_platform_id = review_platform_id
    if @user_review_platform.save
      # Handle successful creation
      TrustpilotScraper.call(@user_review_platform)
      redirect_to review_platform_path(review_platform_id), notice: 'User Review Platform was successfully created.'
    else
      # Handle validation errors
      render :new
    end
  end

  private

  def user_review_platform_params
    params.require(:user_review_platform).permit(:api_key, :user_url, :review_platform_id)
  end
end
