class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
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

end
