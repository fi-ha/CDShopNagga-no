class Administrator::ContactsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user

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
      contacts = Contact.all
      replyedcontacts =  contacts.select do |a| a.respon != nil end
      @replyedcontacts = replyedcontacts.select do |e| e.email == @contact.email end
      @respons = Respon.all
      @respon = Respon.new
    end

    private
    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
    helper_method :find_user
end
