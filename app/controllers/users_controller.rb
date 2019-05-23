class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :judgment_user

	def show
		@user = User.find(params[:id])
	end

  private
    def user_params
    end

		def judgment_user
			unless current_user.id == params[:id].to_i || current_user.admin == true
				redirect_to(root_path)
			end
		end
end
