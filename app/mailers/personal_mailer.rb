class PersonalMailer < ApplicationMailer
 #個別のメール設定

  # 個別のメール設定をdefineで設定していく。それぞれ使いたい部分で関数を呼び出せば使えるんだと思う

  # ============================見本のdefine=====================================
  # 下記アクションを使用したい場合はPersonal.update_when_create(user).deliverと指定する
  def send_when_create(user)
    # テンプレートたちと、メーラーの関係は、viewとcontrollerと一緒。要するにこのアクションに対応するメールの中身はviews/personal_mailer/send_when_create.html.erb or txt.erb
    @user = user
    #mailはメソッド、mail toでは無いmailの中のto
    mail to:      user.email,# 送信先にuserのemailアドレス
         subject: 'こんにちは！新しいユーザーが追加されました'# 題名設定
  end
  #=============================================================================

# =============================お問い合わせフォーム送信=============================
# 下記メソッドを使用したい場合はPersonal.send_when_contact_to_user(@contact).deliverと指定する
  def send_when_contact_to_user(contact)
    # 引き渡されるvalueに@を付けることでメール画面に反映させられる用にする
    @contact = contact
    mail  to:      ENV['MAIL_ADDRESS_KEY'],
          from:    ENV['MAIL_ADDRESS_KEY'],
          subject: 'お問い合わせを受け付けました。'
  end
  #=============================================================================

  # ========================お問い合わせ返信フォーム送信=============================
  # layout "send_when_respon_to_user"
  def send_when_respon_to_user(respon)
    @respon = respon
    @contact = Contact.find_by(id: respon.contact_id)
    mail  to:      @contact.email,
          from:    ENV['MAIL_ADDRESS_KEY'],
          subject: @respon.subject
  end

  #==============================決済メ-ル送信====================================
  # 下記メソッドを使用したい場合はPersonal.send_when_contact_to_user(@contact).deliverと指定する
    def send_when_daibiki_to_user(finish_cart)
      # 引き渡されるvalueに@を付けることでメール画面に反映させられる用にする
      @cart = finish_cart
      @user = User.find_by(id: @cart.user_id)
      @item_carts = @cart.item_carts
      if @cart.ship_to_another_id != nil
        @ship_to_another = ShipToAnother.find_by(id: @cart.ship_to_another_id)
      end
      mail  to:      @user.email,
            from:    ENV['MAIL_ADDRESS_KEY'],
            subject: 'ご注文が完了致しました。'
    end
  #=============================================================================

end
