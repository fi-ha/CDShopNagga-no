class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @labels = Label.all
    @item.stocks.build
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :price, :description, stocks_attributes: [:count])
  end
end
