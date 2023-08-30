class ReviewsController < ApplicationController

  def manage
    @open_reviews = Review.where(status: 'open').order(date: :asc)
    @current_review = @open_reviews.first
  end

  def next_review
    @open_reviews = Review.where(status: 'open').order(date: :asc)
    @current_review = @open_reviews.first
    @current_review.status = "closed"
    @current_review.save
    redirect_to reviews_manage_path
  end

  private

  def set_review_params
    @open_reviews = Review.where(status: 'open').order(date: :asc)
    @current_review = @open_reviews.first
  end
end
