class RemoveReviewPlatformFromReports < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reports, :review_platform, null: false, foreign_key: true
  end
end
