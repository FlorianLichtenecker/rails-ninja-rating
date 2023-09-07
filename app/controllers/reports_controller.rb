class ReportsController < ApplicationController
  before_action :set_review_params

  def new
    @report = Report.create!(user: current_user)
    # @report_id = params[:report_id]
    # @report = Report.find(@report_id)
  end

  def edit
    @report = Report.find(params[:id])
    @action_item = ActionItem.new
    @action_items = ActionItem.where(report: @report)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report", template: "reports/report_pdf", formats: [:html]
      end
    end
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
  end

  def new_report_report_review
    # review_id = params[:review_id]
    # report_id = params[:report_id]
  end


  def add_action_item
  end


private

  def report_params
    params.require(:report).permit(:start_date, :end_date)
  end
  def review_params
    params.require(:review).permit(:status, :date, :content, :rating, :reviewer_name, review_category_ids: [])
  end

  def set_review_params
    @reviews = Review.all
    @open_reviews = current_user.reviews.where(status: 'open').order(date: :asc)
    @closed_review_count = current_user.reviews.where(status: 'closed').where('reviews.updated_at > ?', session[:manage_reviews_timestamp]).count
    @current_review = @open_reviews.first
  end
end
