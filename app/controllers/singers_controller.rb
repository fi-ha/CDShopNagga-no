class SingersController < ApplicationController

	def create
	  singer = Singer.new(singer_params)
	  singer.save
	  redirect_to singers_path
	end

	def index
		@singer = Singer.new
       @singers =Singer.all
	end

	def new

		@singer = Singer.new
		@singers = Singer.all

	end

	def edit
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

	def singer_params
		params.require(:singer).permit(:singer_name)
	end
end
