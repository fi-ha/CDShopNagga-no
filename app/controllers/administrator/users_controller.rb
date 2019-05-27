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
      binding.pry
      sign_in(:user, User.find(params[:id]))
      redirect_to user_path
      # redirect_to root_url # or user_root_url
    end

    #ユーザーidと購入済みのステータスでカートを検索してレコードを取る
    #@userbuydesc = Cart.where(user_id: "対象のユーザーID").where(status:"購入済のステータス").limit 1
    #@userbuydesc = userbuydesc.order(created_at : desc).take
    private
    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
end
