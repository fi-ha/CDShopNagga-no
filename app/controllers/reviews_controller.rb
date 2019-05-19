class ReviewsController < ApplicationController

  def index
  	@reviews = Review.all
  end

  def new
    @reviews = Review.new
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.item_id = Item.find(params[:id]).item_id
    @review.user_id = current_user.id
    @review.save
    redirect_to item_path
  end

  def update
  end

  def destroy
  end

  private
  	def review_params
  		params.require(:review).permit(:body)

end
