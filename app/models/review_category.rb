class ReviewCategory < ApplicationRecord
  belongs_to :review
  belongs_to :category
end
