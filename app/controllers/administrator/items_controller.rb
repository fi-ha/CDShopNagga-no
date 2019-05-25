class Administrator::ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user

    # .build ・・・fields_forでネストした子モデルのデータを作成するメソッド
    def new
      @item = Item.new
      @item.songs.build
      @item.build_stock
      @item.item_singers.build
      @item.item_genres.build
    end

    def index
        @items = Item.all
        @items = Item.search(params[:search])
    end

    def edit
    	@item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to item_path
    end

    def destroy
    	item = Item.find(params[:id])
    	item.destroy
    	redirect_to administrator_items_path
    end

    private
    def item_params
    params.require(:item).permit(:item_name, :label_id, :image, :price, :description,
      stock_attributes: [:id, :count, :_destroy],
      item_singers_attributes: [:id, :singer_id, :_destroy],
      item_genres_attributes: [:id, :genre_id, :_destroy],
      songs_attributes: [:id, :song_name, :disk, :number, :_destroy])
    end

    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
end
