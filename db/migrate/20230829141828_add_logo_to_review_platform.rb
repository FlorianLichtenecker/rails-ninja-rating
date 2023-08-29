class AddLogoToReviewPlatform < ActiveRecord::Migration[7.0]
  def change
    add_column :review_platforms, :logo_url, :string
  end
end
