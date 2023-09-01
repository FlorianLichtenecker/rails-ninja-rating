class AddReferenceToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user_review_platform, foreign_key: true
  end
end
