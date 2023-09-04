class Category < ApplicationRecord
  has_many :review_categories
  has_many :reviews, through: :review_categories
end
