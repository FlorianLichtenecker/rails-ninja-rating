class CreateReviewPlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :review_platforms do |t|
      t.string :name

      t.timestamps
    end
  end
end
