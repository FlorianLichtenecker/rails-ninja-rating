class Review < ApplicationRecord
  belongs_to :user_review_platform
  has_many :review_categories, dependent: :destroy
  has_many :categories, through: :review_categories
end
