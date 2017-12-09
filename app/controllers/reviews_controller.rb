class ReviewsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

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

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.product
  end

  private

    def logged_in?
    end

    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this section."
        redirect_to @product
      end
    end

    def review_params
      params.require(:review).permit(:rating, :description)
    end

end
