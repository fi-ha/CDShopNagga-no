class Administrator::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user

    def index
        @users = User.all
        # @user = User.find(params[:id])
        @buyinglast = Cart.where(user_id:current_user.id).where("status".to_i>= 2).last
        # binding.pry
    end

    def switch
      # return unless current_user.is_an_admin?
      sign_in(:user, User.find(params[:id]))
      redirect_to user_path
      # redirect_to root_url # or user_root_url
    end

    def adminchange
      @user = User.find(params[:id])
      if @user.admin == true
        @user.admin = false
      else
        @user.admin = true
      end

      respond_to do |format|
  			if @user.save
  				#以下の記述で_adminchage.js.erbに飛ぶ
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

    #ユーザーidと購入済みのステータスでカートを検索してレコードを取る
    #@userbuydesc = Cart.where(user_id: "対象のユーザーID").where(status:"購入済のステータス").limit 1
    #@userbuydesc = userbuydesc.order(created_at : desc).take
    private
    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
end
