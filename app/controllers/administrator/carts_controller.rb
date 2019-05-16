class Administrator::CartsController < ApplicationController
    # before_action :admin_user     adminを作って動作確認する時、ここと下のコメントアウト外してください

    def index
        @carts = Cart.all
    end

    def show
        @cart = Cart.find(params)
    end


    # private
    # def admin_user
        # redirect_to(items_path) unless current_user.administrator?
    # end
end
