class LabelsController < ApplicationController
　before_action :authenticate_user!

    def index
    end

    def new
      @label =Lebel.new
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
