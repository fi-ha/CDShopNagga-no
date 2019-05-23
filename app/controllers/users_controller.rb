class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :judgment_user

	def show
		@user = User.find(params[:id])

		@reviews = @user.reviews.all
		@favorites = @user.favorites.all
	end
  
  private

		def judgment_user
			unless current_user.id == params[:id].to_i || current_user.admin == true
				redirect_to(root_path)
			end
		end
end
