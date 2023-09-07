class AddApiKeyAndUrlToUserReviewPlatforms < ActiveRecord::Migration[7.0]
  def change
    add_column :user_review_platforms, :api_key, :string
    add_column :user_review_platforms, :user_url, :string
  end
end
