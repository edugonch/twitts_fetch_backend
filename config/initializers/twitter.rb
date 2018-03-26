require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Rails.application.secrets.twitter[:consumer_key]
  config.consumer_secret     = Rails.application.secrets.twitter[:consumer_secret]
  config.access_token        = Rails.application.secrets.twitter[:access_token]
  config.access_token_secret = Rails.application.secrets.twitter[:access_token_secret]
end