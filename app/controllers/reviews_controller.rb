class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @reviews = @user.reviews.all
  end

  def new
    @review = Review.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @review = current_user.reviews.new(review_params)
    @review.item_id = @item.id
    @review.save
    redirect_to item_path(@item.id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    @review.save
    redirect_to item_path(@review.item)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to item_path(@review.item)
  end

  private
  	def review_params
  		params.require(:review).permit(:item_id, :user_id, :body)
    end

end
