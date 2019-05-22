class Administrator::ReviewsController < ApplicationController
    # before_action :admin_user     adminを作って動作確認する時、ここと下のコメントアウト外してください

    def index
        @reviews = Review.all
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to administrator_reviews_path
    end

    # private
    # def admin_user
        # redirect_to(items_path) unless current_user.administrator?
    # end
end
