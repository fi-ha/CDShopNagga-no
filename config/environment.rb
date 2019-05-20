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
    user_name:            '<YOUR EMAIL ADDRESS>',
    password:             '<YOUR EMAIL PASSWORD>',
    authentication:       'login',
    enable_starttls_auto: true
  }
