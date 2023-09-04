class ReviewPlatformsController < ApplicationController
  def dashboard
    gather_statistics(Review.all)
  end

  def show
    @review_platform = ReviewPlatform.find(params[:id])
    user_review_platform = UserReviewPlatform.where(review_platform: @review_platform)
    reviews_for_platform = Review.where(user_review_platform: user_review_platform)
    gather_statistics(reviews_for_platform)
  end

  private

  def gather_statistics(reviews_scope)
    @ratings_total = reviews_scope.count
    @ratings_average = reviews_scope.average(:rating)
    @latest_one_star_review = reviews_scope.where(rating: 1).max_by { |review| review[:date] }
    @latest_five_star_review = reviews_scope.where(rating: 5).max_by { |review| review[:date] }
    @ratings_count = reviews_scope.group(:rating).count

    @top_5_star_categories = Category.joins(:reviews)
        .where(reviews: { id: reviews_scope.pluck(:id), rating: 5 })
        .group('categories.name, categories.logo_url')
        .select('categories.name, categories.logo_url, COUNT(reviews.id) as review_count')
        .order('review_count DESC')
        .limit(3)

    @top_1_2_3_star_categories = Category.joins(:reviews)
        .where(reviews: { id: reviews_scope.pluck(:id), rating: [1, 2, 3] })
        .group('categories.name, categories.logo_url')
        .select('categories.name, categories.logo_url, COUNT(reviews.id) as review_count')
        .order('review_count DESC')
        .limit(3)

  end
end
