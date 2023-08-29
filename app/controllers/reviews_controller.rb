class ReviewsController < ApplicationController

  def manage
    @open_reviews = Review.where(status: 'open').order(date: :asc)
    @current_review = @open_reviews.first
  end

  def next_review
  end
end
