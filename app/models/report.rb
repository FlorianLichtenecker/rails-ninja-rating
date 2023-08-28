class Report < ApplicationRecord
  has_many :action_items
  belongs_to :user
  belongs_to :review_platform
end
