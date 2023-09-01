class RemoveReferenceFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :review_platform, foreign_key: true, index: false
  end
end
