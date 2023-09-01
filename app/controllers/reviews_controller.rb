class ReviewsController < ApplicationController
  before_action :set_review_params, only: [:manage, :next_review]

  def manage
    session[:outstanding_reviews_count] = @open_reviews.count if session[:outstanding_reviews_count].nil?
    session[:processed_reviews_count] = 0 unless session[:processed_reviews_count].positive?
  end

  def next_review
    @current_review.status = "closed"
    @current_review.save
    session[:processed_reviews_count] += 1
    redirect_to reviews_manage_path
  end

  private

  def review_params
    params.require(:review).permit(:status, :date, :content, :rating, :reviewer_name, review_category_ids: [])
  end


  def set_review_params
    @open_reviews = current_user.reviews.where(status: 'open').order(date: :asc)
    @closed_review_count = current_user.reviews.where(status: 'closed').where('reviews.updated_at > ?', session[:manage_reviews_timestamp]).count
    @current_review = @open_reviews.first
  end
end
