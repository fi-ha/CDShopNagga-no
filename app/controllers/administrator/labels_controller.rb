class Administrator::LabelsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user

    def index
      @label = Label.new
      @labels = Label.all
    end

    def edit
        @label = Label.find(params[:id])
    end

    def create
        @label = Label.new(label_params)
        @label.save
        redirect_to administrator_labels_path
    end

    def update
        @label = Label.find(params[:id])
        @label.update(label_params)
        redirect_to administrator_labels_path
    end

    def destroy
        @label = Label.find(params[:id])
        @label.destroy
        redirect_to administrator_labels_path
    end

    private
    def label_params
    params.require(:label).permit(:label_name)
    end

    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
end
