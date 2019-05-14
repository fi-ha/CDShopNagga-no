class LabelsController < ApplicationController
    def index
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end

    private
    def label_params
    params.require(:label).permit(:label_name)
    end
end
