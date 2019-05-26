class CartsController < ApplicationController

  before_action :authenticate_user!
  before_action :judgment_user

  def create
    item = Item.find_by(id: params[:item_id])
    # ユーザーがログイン状態の時
    # もしユーザーのカートのstatusがカート状態だったら
    # カートを連続使用、ちゃうかったらカート新規作成
    # そもそもログインしてなかったログイン画面に飛ばす
    if user_signed_in? && current_user.carts.where(status: "カート")
      cart = current_user.carts.find_by(status: "カート")

      # cartに紐付いたitem_cartsにクリックした商品がなければitem_cart.new
      # あればそれを使用し個数を＋1する
      if cart.item_carts.where(item_id: params[:item_id]).blank?
        # ここの記述をfind_or_create_byに変更できるかもしれない
        item_cart = ItemCart.new
        item_cart.item_id = params[:item_id]
        item_cart.cart_id = cart.id
        item_cart.item_count = 1
        item_cart.price = item.price
        item_cart.save
      else
        item_cart = cart.item_carts.find_by(item_id: params[:item_id])
        item_cart.increment!(:item_count)
        # 開発段階のためpriceが入っていない場合がある為の分岐
        if item_cart.price = 0 || item_cart.price == nil
          item_cart.price = item.price
          item_cart.save
        end
      end
      # 商品が安くなっていた場合、値段を安く更新する
      if item_cart.price.to_i > item.price.to_i
        item_cart.price = item.price
        item_cart.save
        flash[:alert] = "お値段が安くなりました。"
      end

      redirect_to cart_edit_path(cart.id)

      # 新規登録後だと以下を使用する
    elsif user_signed_in? && !current_user.carts.where(status: "カート")
      cart = Cart.new
      cart.user_id = current_user.id
      cart.status = "カート"
      cart.save

      item_cart = ItemCart.new
      item_cart.item_id = params[:item_id]
      item_cart.cart_id = cart.id
      item_cart.item_count = 1
      item_cart.price = item.price
      item_cart.save

      redirect_to cart_edit_path(cart.id)

    else
      flash[:alert] = "ログインしてください。"
      redirect_to root_path
    end
  end

  def edit
    # createメソッドからのパラメータを受け取る
    # Cartの中から現在のログインユーザーかつ、statusがカート状態のカートを取り出す関数定義
    @cart = Cart.find_by(id: params[:id])
    # cartのidとアソシエーションしているItem_cartを取り出す
    @item_carts = @cart.item_carts

    @sumprice = 0
      for item_cart in @item_carts do
        a = item_cart.price * item_cart.item_count
        @sumprice += a
        return @sumprice
      end
  end

  def cartedit
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to ship_to_another_edit_path(@cart.id)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to edit_cart_path(cart.id)
  end


  def index
  end

  def new
  end


  def ship
     # # Cartの中から現在のログインユーザーかつ、statusがカート状態のカートを取り出す関数定義
     # def current_cart_id
     #   current_cart = Cart.where(user_id: current_user.id).where(status: 1)
     #   current_cart_id = current_cart.id
     #   return current_cart_id
     # end
     # @user = User.find(id: current_user.id)
  end

  def shipedit
    # @ship = Ship_to_another.new
    # # attributesメソッドで一気にカラムを指定できるが設定方法これで合ってるのか？
    # @ship.attributes = {first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, postal_codeaddress: postal_codeaddress, email: email}
    # # 保存が必要
    # @ship.save
    # redirect_to payment_edit_path
  end

  def pay
     # 特に呼び出すものなし画面を表示しているだけ
  end

  def payedit
    # cart = current_cart_id
    # cart.update(post_params)
    # redirect_to confirm_edit_path
  end

  # def confirm
  #   # 現在のカートを取り出す
  #   cart = current_user.carts.find_by(status: 1)
  #   # cartのidとアソシエーションしているItem_cartを取り出す
  #   @item_carts = cart.item_carts
  #   # 更にitem_cartsとアソシエーションしているitemsを取り出す
  #   @items = @item_carts.items
  #   # itemとアソシエーションしているitem_singers、item_genres、を取り出す
  #   @item_singers = @items.item_singers
  #   @item_genres = @items.item_genres
  #   # Genre,Stocks,Singer,Labelsからアソシエーションで関連しているデータを取り出す。
  #   @genres = @item_genres.genres
  #   @labels = @items.labels
  #   # for で itemsをitemに変換し繰り返すその中で計算合計を出すさらにitem_stockにpriceを保管、sumpriceをcartに保管@sumprice
  #   @sumprice = 0
  #   for item in @items do
  #     a = item.price * item.@item_carts.item_count
  #     @sumprice += a
  #   end
  #
  #   cart.total_price = @sumprice
  #   cart.save
  #
  #   if cart.ship_to_another
  #     @ship_to_another = cart.ship_to_anothers
  #   end
  #
  #   case cart.payment
  #     when 1 then
  #      @payment = "<p>銀行振込</p><%= link_to '購入確定', confirm_ginko_path %>"
  #
  #     when 2 then
  #      @payment = "<p>代金引換</p><%= link_to '購入確定', confirm_daibiki_path %>"
  #
  #     when 3 then
  #      @payment = "<p>クレジットカード</p><%= link_to '購入確定', confirm_cred_path %>"
  #
  #    else
  #      @peyment = "<%= link_to '支払い方法選択に戻る' , payment_edit_path %>"
  #    end
  # end

  def ginko
    cart = current_user.carts.find_by(status: 1)
    cart.status = '未発送'
    cart.total_price = params[:sumprice]
    cart.save
    Personal.send_when_ginko_to_user(cart).deliver
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

  private
    def cart_params
      params.require(:cart).permit(:user_id, :ship_to_another_id, :payment, :total_price, :status,
        item_carts_attributes: [:item_id, :cart_id, :item_count, :price])
    end

    def post_params
      # ストロングパラメーター、ビューフォームからのコントローラーへの情報受け渡しを以下のカラムのみ許可
        params.require(:cart).permit(:title, :body, :payment, :status)
    end

    def judgment_user
			unless current_user.id == params[:id].to_i || current_user.admin == true
				redirect_to(root_path)
			end
		end

end
