class ReviewPlatformsController < ApplicationController
  def dashboard
    gather_statistics(Review.all)
  end

  def show
    reviews_for_platform = Review.where(review_platform_id: params[:id])
    gather_statistics(reviews_for_platform)
  end

  private

  def gather_statistics(reviews_scope)
    @ratings_total = reviews_scope.count
    @ratings_average = reviews_scope.average(:rating)
    @latest_one_star_review = reviews_scope.where(rating: 1).max_by { |review| review[:created_at] }
    @latest_five_star_review = reviews_scope.where(rating: 5).max_by { |review| review[:created_at] }
    @ratings_count = reviews_scope.group(:rating).count
  end
end
