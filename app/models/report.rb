class Report < ApplicationRecord
  has_many :action_items
  has_many :report_reviews
  has_many :reviews, through: :report_reviews
  belongs_to :user

end
