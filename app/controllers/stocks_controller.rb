class StocksController < ApplicationController

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
