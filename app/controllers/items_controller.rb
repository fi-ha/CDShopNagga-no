class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    # 一覧表示ビュー作成
    @items = Item.all
    @items = Item.search(params[:search])

  end

  def show
    # 詳細ビュー作成
    @item = Item.find(params[:id])
    @review = Review.new
  end

  def edit
    # 編集ビュー作成
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to administrator_items_path
  end

  def update
    # パラメータを呼び出し、アップデート。
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to administrator_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to administrator_items_path
  end

  # _attributes: []
  # fields_forでネストしたモデルへデータを渡す際に、paramsを設定する
  private

  def item_params
    params.require(:item).permit(:item_name, :label_id, :image, :price, :description,
      stock_attributes: [:id, :count, :_destroy],
      item_singers_attributes: [:id, :singer_id, :_destroy],
      item_genres_attributes: [:id, :genre_id, :_destroy],
      songs_attributes: [:id, :song_name, :disk, :number, :_destroy])
  end
end
