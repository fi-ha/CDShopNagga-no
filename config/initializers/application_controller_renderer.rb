# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
# Refileに追加しろと言われた

Refile.secret_key = ENV['REFILE_SECRET_KEY']
