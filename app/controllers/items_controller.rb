class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  #販売中、販売停止切り替え用
  before_action :set_item, only:[:toggle_status]


  def toggle_status
    @item.toggle_status!
    redirect_to administrator_items_path
  end

  def index
    # 一覧表示ビュー作成
    @items = Item.all
    @items = Item.search(params[:search])
    current_user

  end

  def show
    # 詳細ビュー作成
    @item = Item.find(params[:id])
    cd_genre_id = ItemGenre.find_by(item_id: @item.id).genre_id
    # item_item_genres = Item.group(:item_genres)
    # @player = item_item_genres.find_by(genre_id: cd_genre_id, description: true)
    item_genres = ItemGenre.where(genre_id: cd_genre_id)
    @players = item_genres.select { |item_genre| item_genre.item.description != nil }
    @player = @players.first.item
    @review = Review.new
    if @item.active == "販売停止"
      @items = Item.all
      @items = Item.search(params[:search])
      render "items/index"
    end
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
      stock_attributes: [:id, :stock_count, :_destroy],
      item_singers_attributes: [:id, :singer_id, :_destroy],
      item_genres_attributes: [:id, :genre_id, :_destroy],
      songs_attributes: [:id, :song_name, :disk, :number, :_destroy])
  end

   #販売中、販売停止切り替え用
  private
  def set_item
    @item = Item.find(params[:id] || params[:item_id])
  end

end
