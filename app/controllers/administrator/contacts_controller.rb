class Administrator::ContactsController < ApplicationController
    # before_action :admin_user     adminを作って動作確認する時、ここと下のコメントアウト外してください
    # foreignキーが設定されていればユーザーを取り出す

    def find_user(parent)
      return User.find_by(id: parent.user_id) if parent.user_id
    end

    def index
      contacts = Contact.all
      @replyedcontacts =  contacts.select do |a| a.respon != nil end
      @unreplycontacts =  contacts.select do |a| a.respon == nil end
    end

    def show
      id = params[:id]
      @contact = Contact.find_by(id: id)
      @user = find_user(@contact)
      @respon = Respon.new
    end

    # private
    # def admin_user
        # redirect_to(items_path) unless current_user.administrator?
    # end
    helper_method :find_user
end
