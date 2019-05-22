class SingersController < ApplicationController
	    before_action :authenticate_user!


	def create
	  singer = Singer.new(singer_params)
	  singer.save
	  redirect_to singers_path
	end

	def index
		@singer = Singer.new
       @singers =Singer.all
	end

	def edit
		@singer = Singer.find(params[:id])
	end

	def destroy
		singer = Singer.find(params[:id])
		singer.destroy
		redirect_to singers_path
	end

	def update
	   singer = Singer.find(params[:id])
	   singer.update(singer_params)
	   redirect_to singers_path
	end

	private
	 def singer_params
	 	params.require(:singer).permit(:singer_name)
	 end
end
