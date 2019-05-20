class ApplicationMailer < ActionMailer::Base
  default from: 'FIHAからのメールだよ',
          bcc:      "ENV['MAIL_ADDRESS_KEY']",
          reply_to: "ENV['MAIL_ADDRESS_KEY']"
  layout 'mailer'
end
