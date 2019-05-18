class ItemsController < ApplicationController

  def index
    # 一覧表示ビュー作成
    @items = Item.all
  end

  def show
    # 詳細ビュー作成
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @labels = Label.all
    @song = Song.new
    @stock = Stock.new
    @item.stocks.build
  end

  def edit
    # 編集ビュー作成
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @stock = Stock.new(stock_params)
    if @item.save && @stock.save
    redirect_to new_item_path
    else
      render :index
    end
  end

  def update
    # パラメータを呼び出し、アップデート。
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :price, :description)
  end

  def stock_params
    params.require(:stock).permit(:count)
  end
end
