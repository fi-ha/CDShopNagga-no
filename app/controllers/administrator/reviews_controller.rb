class Administrator::ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user

    def index
        @reviews = Review.all
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to administrator_reviews_path
    end

    private
    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
end
