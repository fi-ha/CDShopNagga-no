class Administrator::ContactsController < ApplicationController
    before_action :admin_user

    def index
        @contacts = Contact.all
    end

    private
    def admin_user
        redirect_to(items_path) unless current_user.administrator?
    end
end
