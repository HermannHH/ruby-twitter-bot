#!/usr/bin/env ruby
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

search_options = {
  result_type: "recent",
  geocode: "-33.9166667,18.4166667,100mi"
}

client.search("#entrepreneur", search_options).take(10).each do |tweet|
  puts tweet.text
  client.favorite(tweet)
end