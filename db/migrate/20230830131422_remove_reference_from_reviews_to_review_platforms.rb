class RemoveReferenceFromReviewsToReviewPlatforms < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :reviews, :review_platforms
  end
end
