class ReviewsController < ApplicationController

  def index
  	@reviews = Review.all
  end

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  	def review_params
  		params.require(:review).permit(:review)

end
