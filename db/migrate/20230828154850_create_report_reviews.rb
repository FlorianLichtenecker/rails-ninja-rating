class CreateReportReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :report_reviews do |t|
      t.references :report, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
