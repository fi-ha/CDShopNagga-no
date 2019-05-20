# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    port:                 587,
    address:              'smtp.gmail.com',
    domain:               'smtp.gmail.com',
<<<<<<< HEAD
    user_name:            ENV['MAIL_ADDRESS_KEY'],
    password:             ENV['MAIL_PASSWORD_KEY'],
=======
    user_name:            '<YOUR EMAIL ADDRESS>',
    password:             'テスト編集<YOUR EMAIL PASSWORD>',
>>>>>>> 8600a33ca15ffd1849e8c8a87be8886383ab69eb
    authentication:       'login',
    enable_starttls_auto: true
  }
