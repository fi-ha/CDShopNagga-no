class FavoritesController < ApplicationController

	def index
		@favorites = @user.favorites.all
	end

	def create
		item = Item.find(params[:item_id])
		favorite = current_user.favorites.new(item_id: item.id)
		favorite.save
		redirect_to item_path(item.id)
	end

    def destroy
    	item = Item.find(params[:item_id])
    	favorite = current_user.favorites.find_by(item_id: item.id)
    	favorite.destroy
    	redirect_to item_path(item.id)
    end
end
