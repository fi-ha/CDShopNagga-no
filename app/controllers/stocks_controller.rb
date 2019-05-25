class StocksController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@stock = Stock.new(stock_params)
		@stock.save
	end

	def update
	end

	private
	def stock_params
		params.require(:stock).permit(:count)
	end

end
