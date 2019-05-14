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
  end

  def edit
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
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image_id, :price, :description)
  end

end
