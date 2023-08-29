class AddAttributesToReviewModel < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :reviewer_name, :string
  end
end
