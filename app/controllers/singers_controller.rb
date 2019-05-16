class SingersController < ApplicationController
  before_action :authenticate_user!

	def create
	end

	def index
	end

	def new
		@singer = Singer.new
	end

	def edit
	end

	def destroy
	end

	def update
	end
end
