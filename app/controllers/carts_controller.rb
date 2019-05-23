class CartsController < ApplicationController

  def show
  end

  def edit
    # createメソッドからのパラメータを受け取る
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update
    redirect_to ship_to_another_edit_path(@cart.id)
  end

  def create
    # ユーザーがログイン状態の時
    if user_signed_in?
      # ItemCartの空インスタンスを渡す。モデルは＿を使ってはいけない為Item_cartではなくItemCart
      @item_cart = ItemCart.new
      # カートのカラムにcreate_with()の条件に当てはまるものがあればデータを引っ張る
      # なければ新しくつくる。以下参考メソッド。今回のMVP。
      # http://railsdoc.com/references/find_or_create_by
      cart = Cart.create_with(user_id: current_user.id, status: 1).find_or_create_by(user_id: current_user.id, status: 1)
      # views/items/showからlink_toメソッドでitem_idを送ったところ、
      # carts#create のparamsをbinding.pryで確認したところ、:idではなく:formatでitem_idが渡されていた。
      item = Item.find(params[:format])
      @item_cart.cart_id = cart.id
      @item_cart.item_id = item.id
      # ここ重複商品なら＋１する記述を考えなければならない。
      @item_cart.count = 1
      @item_cart.price = item.price
      @item_cart.save
      # views/carts/:id/editへ、カートIDのパラメータを持たせてリンクを飛ばす。
      redirect_to edit_cart_path(cart.id)
   else
    # ログインしてないときは一覧画面に戻る
      flash[:alert] = "ログインしてください。"
      redirect_to root_path
    end
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

  def update
  end

  private

    def cart_params
      params.require(:cart).permit(:user_id, :ship_to_another_id, :payment, :total_price, :status)
    end

end
