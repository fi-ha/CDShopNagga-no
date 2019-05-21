class ResponsesController < ApplicationController
    def new
    end

    def create
    end

    private
    def response_params
        params.require(:response)
    end
end
