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
    if @item.save
    redirect_to new_item_path
    else
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :price, :description, stocks_attributes: [:id, :count])
  end
end
