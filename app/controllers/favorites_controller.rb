class FavoritesController < ApplicationController
  before_action :authenticate_user!

	def index
		@favorites = @user.favorites.all
	end
  
	def create
		item = Item.find(params[:item_id])
		favorite = current_user.favorites.new(item_id: item.id)
		favorite.save
# binding.pry
		case params[:favorite]
			when 'cartedit' then
				# redirect_to edit_cart_path(params[:id)
               redirect_back(fallback_location: edit_cart_path(params[:id]))
			when 'itemshow' then
				redirect_to item_path(item.id)
		else
			redirect_to item_path(item.id)
		end
	 end


    def destroy
    	item = Item.find(params[:item_id])
    	favorite = current_user.favorites.find_by(item_id: item.id)
    	favorite.destroy
          case params[:favorite]
			when 'cartedit' then
				# redirect_to edit_cart_path(params[:id)
               redirect_back(fallback_location: edit_cart_path(params[:id]))
			when 'itemshow' then
				redirect_to item_path(item.id)
		    else
			    redirect_to item_path(item.id)    
		end 
	  end
   end