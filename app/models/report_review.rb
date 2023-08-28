class ReportReview < ApplicationRecord
  belongs_to :report
  belongs_to :review
end
