class Administrator::UsersController < ApplicationController
    # before_action :admin_user    adminを作って動作確認する時、ここと下のコメントアウト外してください

    def index
        @users = User.all
    end

    # private
    # def admin_user
        # redirect_to(items_path) unless current_user.administrator?
    # end
end
