class CartsController < ApplicationController

  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @item_carts = current_cart.item_carts
  end

  def add_item
    if @item_cart.blank?
      @item_cart = current_cart.item_carts.build(item_id: params[:item_id])
    end
    @item_cart.count += params[:count].to_i
    @item_cart.save
    redirect_to current_cart
  end

  def update_item
    @item_cart.update(count: params[:count].to_i)
    redirect_to current_cart
  end

  def delete_item
    @item_cart.destroy
    redirect_to current_cart
  end

  def index
  end

  def new
  end

  def edits

  end


  def cartedit

  end

  def ship

  end

  def shipedit

  end

  def pay

  end

  def payedit

  end

  def confirm
    # ここはeditアクションと同じ記述だからどこかに逃したい
    # cartのidとアソシエーションしているItem_cartを取り出す
    # @item_carts = Item_carts.find(cart_id: current_cart_id)
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
    # for で itemsをitemに変換し繰り返すその中で計算合計を出すさらにitem_stockにpriceを保管、sumpriceをcartに保管@sumprice
    # @ship_to_another = current_cart_id.ship_to_anothers
    # case cart.payment
    # when 1 then
    #   @payment = "<p>銀行振込</p><%= link_to "支払い方法選択に戻る", payment_edit_path %><%= link_to "購入確定", confirm_ginko_path %>"
    # when 2 then
    #   @payment = "<p>代金引換</p><%= link_to "支払い方法選択に戻る", payment_edit_path %><%= link_to "購入確定", confirm_daibiki_path %>"
    # when 3 then
    #   @payment = "<p>クレジットカード</p><%= link_to "支払い方法選択に戻る", payment_edit_path %><%= link_to "購入確定", confirm_cred_path %>"
    # else
    #   @payment = "<p>支払い方法が選択されておりません</p><%= link_to "支払い方法選択に戻る" , payment_edit_path %>"
    # end
  end

  def ginko
    # 発送メール送信
    redirect_to finish_path
  end

  def daibiki
    # 発送メール送信
    redirect_to finish_path
  end

  def cred
    # payjp処理
    # 発送メール送信
    redirect_to finish_path
  end

  def create
  end

  def update
  end

  private

    def post_params
      # ストロングパラメーター、ビューフォームからのコントローラーへの情報受け渡しを以下のカラムのみ許可
        params.require(:cart).permit(:title, :body, :payment, :status)
    end

    def item_cart_params
      params.require(:oitem_cart).permit(
        :post
      )
    end

    def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    end

end
