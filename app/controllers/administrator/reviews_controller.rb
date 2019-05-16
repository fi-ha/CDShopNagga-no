class Administrator::ReviewsController < ApplicationController
    before_action :admin_user

    def index
        @reviews = Review.all
    end

    def edit
        @review = Review.find(params)
    end

    private
    def admin_user
        redirect_to(items_path) unless current_user.administorator?
    end
end
