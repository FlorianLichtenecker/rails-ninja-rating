class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :empty_review_count

  def after_sign_in_path_for(_)
    dashboard_path
  end

  def empty_review_count
    if params[:controller] != "reviews"
      session[:outstanding_reviews_count] = nil
      session[:processed_reviews_count] = 0
    end
  end
end
