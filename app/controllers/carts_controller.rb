class CartsController < ApplicationController
  def index
  end

  def new
  end

  def edit
    # Cartの中から現在のログインユーザーかつ、statusがカート状態のカートを取り出す関数定義
  end

    # def current_cart_id
    #   current_cart = Cart.where(user_id: current_user.id).where(status: 1)
    #   current_cart_id = current_cart.id
    #   return current_cart_id
    # end
    # cartのidとアソシエーションしているItem_cartを取り出す
    # item_carts = Item_carts.find(cart_id: current_cart_id)
    # 更にitem_cartsとアソシエーションしているitemsを取り出す
    # @items = item_carts.items
    # itemとアソシエーションしているitem_singers、item_genres、を取り出す
    # @item_singers = @items.item_singers
    # @item_genres = @items.item_genres
    # Genre,Stocks,Singer,Labelsからアソシエーションで関連しているデータを取り出す。
    # @genres = @item_genres.Genres
    # @stocks = @item.Stocks
    # @singers = @item_singers.Singer
    # @labels = @items.Labels

  def cartedit
    # カートページからはitemに対応するitem_cart.countとその時の価格を保存する
    # def multi_update(item_cart_params)
    #   item_cart_params.to_h.map do |id, item_cart_param|
    #     item_cart = self.find(id)
    #     item_cart.update_attributes!(item_cart_param)
    #   end
    # end
    # Item_cart.multi_update(item_cart_params)
    redirect_to ship_to_another_edit_path
  end

  def ship
    # Cartの中から現在のログインユーザーかつ、statusがカート状態のカートを取り出す関数定義
    # def current_cart_id
    #   current_cart = Cart.where(user_id: current_user.id).where(status: 1)
    #   current_cart_id = current_cart.id
    #   return current_cart_id
    # end
    # @user = User.find(id: current_user.id)
    # 次ページのship_anotherのテーブルを新規で作る
    # @ship = Ship_to_another.new
  end

  def shipedit
    # @ship.update
    redirect_to payment_edit_path
  end

  def pay

  end

  def create
  end

  def update
  end

  private

    def post_params
        params.require(:cart).permit(:title, :body)
    end

    def item_cart_params
      params.require(:oitem_cart).permit(
        :post
      )
    end

end
