class ApplicationMailer < ActionMailer::Base
  default from: 'FIHAからのメールだよ',# 	メールの送り主の名前
          bcc:      "ENV['MAIL_ADDRESS_KEY']",# BCCで同時に送る宛先
          reply_to: "ENV['MAIL_ADDRESS_KEY']"# 返信した場合の受信先アドレス
  layout 'mailer'
end
