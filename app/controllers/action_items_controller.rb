class ActionItemsController < ApplicationController
  def index
    @report = Report.find(params[:report_id])
  end

  def create
    @report = Report.find(params[:report_id])
    @action_item = ActionItem.new(action_item_params)
    @action_item.report = @report
    @action_item.save
    redirect_to edit_report_path(@report)
  end

  private

  def action_item_params
    params.require(:action_item).permit(:content)
  end
end
