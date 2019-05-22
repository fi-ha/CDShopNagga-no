class ContactsController < ApplicationController
    def new
    end

    def create
    	
    end

    private
    def contact_params
        params.require(:contact)
    end
end
