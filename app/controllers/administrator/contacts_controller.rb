class Administrator::ContactsController < ApplicationController
    # before_action :admin_user     adminを作って動作確認する時、ここと下のコメントアウト外してください
    # foreignキーが設定されていればユーザーを取り出す
    def find_user(parent)
      return User.find_by(id: parent.user_id) if parent.user_id
    end

    def index
      @unreplycontacts = Contact.all
    end

    def show
      
    end

    # private
    # def admin_user
        # redirect_to(items_path) unless current_user.administrator?
    # end
    helper_method :find_user
end
