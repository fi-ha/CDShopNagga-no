class Administrator::ItemsController < ApplicationController
    # before_action :admin_user     adminを作って動作確認する時、ここと下のコメントアウト外してください

    def index
        @items = Item.all
    end

    def edit
    	@item = Item.find(params[:id])
    end

    def update
    	@item = Item.find(params[:id])
    	@item.update
    	redirect_to administrator_item_path
    end

    def destroy
    	item = Item.find(params[:id])
    	item.destroy
    	redirect_to administrator_items_path
    end

    # private
    # def admin_user
        # redirect_to(items_path) unless current_user.administrator?
    # end
end
