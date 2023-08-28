class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :status
      t.date :date
      t.string :content
      t.integer :rating
      t.references :review_platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
