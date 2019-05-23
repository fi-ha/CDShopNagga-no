class CartsController < ApplicationController
  def index
  end

  def new
  end

  def edit
    # # Cartの中から現在のログインユーザーかつ、statusがカート状態のカートを取り出す関数定義
    # 下記のdefineを別のファイルに保存する場合そのモデルに対応する.rbに書くとよろしい
    # def current_cart_id
    #   current_cart = Cart.where(user_id: current_user.id).where(status: 1)
    #   current_cart_id = current_cart.id
    #   return current_cart_id
    # end
    # # cartのidとアソシエーションしているItem_cartを取り出す
    # item_carts = Item_carts.find(cart_id: current_cart_id)
    # # 更にitem_cartsとアソシエーションしているitemsを取り出す
    # @items = item_carts.items
    # # itemとアソシエーションしているitem_singers、item_genres、を取り出す
    # @item_singers = @items.item_singers
    # @item_genres = @items.item_genres
    # # Genre,Stocks,Singer,Labelsからアソシエーションで関連しているデータを取り出す。
    # @genres = @item_genres.Genres
    # @stocks = @item.Stocks
    # @singers = @item_singers.Singer
    # @labels = @items.Labels
  end


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
  end

  def shipedit
    # @ship = Ship_to_another.new
    # attributesメソッドで一気にカラムを指定できるが設定方法これで合ってるのか？
    # @ship.attributes = {first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, postal_codeaddress: postal_codeaddress, email: email}
    # 保存が必要
    # @ship.save
    redirect_to payment_edit_path
  end

  def pay
    # 特に呼び出すものなし画面を表示しているだけ
  end

  def payedit
    # cart = current_cart_id
    # cart.update(post_params)
    redirect_to confirm_edit_path
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

end
