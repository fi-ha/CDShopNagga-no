class ContactsController < ApplicationController
    def new
    end

    def create
    end

    def index
    end

    def show
    end

    def update
    end
    
    private
    def contact_params
        params.require(:contact)
    end
end
