class ReviewPlatformsController < ApplicationController
  def dashboard
    @ratings_total = Review.all.count
    @ratings_average = Review.all.average(:rating)
  end
end
