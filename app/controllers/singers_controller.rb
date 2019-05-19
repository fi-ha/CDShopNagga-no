class SingersController < ApplicationController

	def create
	end

	def index
	   @singer = Singer.new
       @singers =Singer.all
	end

	def new
	end

	def edit
	end

	def destroy
	end

	def update
	end
end
