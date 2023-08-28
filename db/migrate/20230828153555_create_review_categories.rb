class CreateReviewCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :review_categories do |t|
      t.boolean :is_primary
      t.references :review, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
