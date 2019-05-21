class ResponsesController < ApplicationController
    def create
    end

    private
    def response_params
        params.require(:response)
    end
end
