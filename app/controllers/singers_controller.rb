class SingersController < ApplicationController
  # before_action :authenticate_user!

	def create
		@singer = Singer.new(singer_params)
		@singer.save
		redirect_to new_singer_path
	end

	def index
		@singers = Singer.all
	end

	def new
		@singer = Singer.new
		@singers = Singer.all
	end

	def edit
	end

	def destroy
	end

	def update
	end

	private
	def singer_params
		params.require(:singer).permit(:singer_name)
	end
end
