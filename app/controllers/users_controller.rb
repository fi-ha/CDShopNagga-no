class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :judgment_user

	def show
		@user = User.find(params[:id])
        @purchases = @user.carts
        @reviews = @user.reviews.all
		@favorites = @user.favorites.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def user_update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id), notice: "編集が完了しました。"
	end

	def update
		@user = User.find(params[:id])
		case @user.admin
			when "true" then
				@user.admin = "false"
			when "false" then
				@user.admin = "true"
			else
				@user.admin = "false"
		end

		respond_to do |format|
			if @user.save
				#以下の記述でedit.js.erbに飛ぶ
				format.js
				# htmlには以下を返す
				format.html { redirect_to @user, notice: 'Band was successfully created.' }
				# jsonには以下を返す
				format.json { render :show, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

  private

  		def user_params
  			params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :addres, :phone_number, :email, :password)
  		end

		def judgment_user
			unless current_user.id == params[:id].to_i || current_user.admin == true
				redirect_to(root_path)
			end
		end
end
