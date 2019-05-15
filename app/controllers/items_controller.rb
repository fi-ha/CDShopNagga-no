class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = item.find(params[:id])
  end

  def new
    @item = Item.new
    @labels = Label.all
    @stock = Stock.new
    @song = Song.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @stock = Stock.new(stock_params)
    if @item.save && @stock.save
    redirect_to items_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image_id, :price, :description)
  end

  private
	def stock_params
		params.require(:stock).permit(:count)
	end


end
