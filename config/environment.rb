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
    user_name:            "ENV['MAIL_ADDRESS_KEY']",
    password:             "ENV['MAIL_PASSWORD_KEY']",
    authentication:       'login',
    enable_starttls_auto: true
  }
