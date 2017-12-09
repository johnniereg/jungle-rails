class ReviewsController < ApplicationController


  def create

    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user
    
    
    if @review.save!
      flash[:notice] = 'Review successfully submitted.'
      redirect_to @product
    else
      render @product
    end
    


  end

  private

    def review_params
      params.require(:review).permit(:rating, :description)
    end

end
