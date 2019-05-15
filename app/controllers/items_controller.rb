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
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to items_path
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path
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
