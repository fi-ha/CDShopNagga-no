class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])

		@reviews = @user.reviews.all
		@favorites = @user.favorites.all
	end
end
