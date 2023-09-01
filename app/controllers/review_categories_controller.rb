# class ReviewCategoriesController < ApplicationController

#   def create
#     @review = Review.find(params)[review_id]
#     @categories = Category.all
#     @review_category = Review_category.new(review_category_params)

#   end


#   private

#   def review_category_params
#     params.require(:review_category).permit(:is_primary, category_id: [])
#   end
# end

class ReviewCategoriesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    category_ids = params[:review_category][:category_id].reject(&:blank?)

    # Iterate over each category id in category_ids
    # For each iteration, create a ReviewCategory which needs a review and a category
    category_ids.each do |category_id|
      category = Category.find(category_id)
      ReviewCategory.create(category: category, review: @review)
    end

    redirect_to reviews_manage_path
  end

  private

  def review_category_params
    params.require(:review_category).permit(:is_primary, category_id: [])
  end
end
