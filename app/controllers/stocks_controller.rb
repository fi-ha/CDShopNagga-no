class StocksController < ApplicationController
	before_action :authenticate_user!

	def create
		@stock = Stock.new(stock_params)
		@stock.save
	end

	private
	def stock_params
		params.require(:stock).permit(:stock_count)
	end

end
