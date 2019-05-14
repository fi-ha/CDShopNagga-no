class CartsController < ApplicationController
  def index
  end

  def new
    # Cartの中から現在のログインユーザーかつ、statusがカート状態のカートを取り出す関数定義
    def current_cart_id
      current_cart = Cart.where(user_id: current_user.id).where(status: 1)
      current_cart_id = current_cart.id
      return current_cart_id
    end
    # cartのidとアソシエーションしているItem_cartを取り出す
    item_carts = Item_carts.find(cart_id: current_cart_id)
    # 更にitem_cartsとアソシエーションしているitemを取り出す
    @items = item_carts.items
    # itemとアソシエーションしているitem_singersを取り出す
    @item_singers = @items.item_singers
    @singers = Singer.@item_singers
    @item_genres = @items.item_genres
    @genres = Genres.@item_genres
    @stocks = @items.stocks
    @labels = @items.labels

  end

  def edit
  end

  def create
  end

  def update
  end

end
