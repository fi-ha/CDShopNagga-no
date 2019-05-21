class PersonalMailer < ApplicationMailer
 #個別のメール設定

  # 個別のメール設定をdefineで設定していく。それぞれ使いたい部分で関数を呼び出せば使えるんだと思う

  # 下記部分は見本のdefine
  def send_when_create(user)
    # テンプレートたちと、メーラーの関係は、viewとcontrollerと一緒。要するにこのアクションに対応するメールの中身はviews/send_when_create.html.erb or txt.erb
    @user = user
    #mailはメソッド、mail toでは無いmailの中のto
    mail to:      user.email,# 送信先にuserのemailアドレス
         subject: 'こんにちは！新しいユーザーが追加されました'# 題名設定
  end

end
