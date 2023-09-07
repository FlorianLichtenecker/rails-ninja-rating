class ReportReviewsController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @review = Review.find(params[:review_id])
    ReportReview.create!(report: @report, review: @review)
    # @report_reviews = @report.report_reviews
    redirect_to edit_report_path(@report)
  end
end
