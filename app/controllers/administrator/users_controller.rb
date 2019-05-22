class Administrator::UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
        # @user = User.find(params[:id])
        @buyinglast = Cart.where(user_id:current_user.id).where("status".to_i>= 2).last
        # binding.pry
    end

    #ユーザーidと購入済みのステータスでカートを検索してレコードを取る
    #@userbuydesc = Cart.where(user_id: "対象のユーザーID").where(status:"購入済のステータス").limit 1
    #@userbuydesc = userbuydesc.order(created_at : desc).take
end
