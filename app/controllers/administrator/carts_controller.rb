class Administrator::CartsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user

    def index
        @carts = Cart.all
    end

    def show
        @cart = Cart.find(params)
    end


    private
    def admin_user
        redirect_to(root_path) unless current_user.admin?
    end
end
