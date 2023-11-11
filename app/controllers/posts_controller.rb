# app/controllers/posts_controller.rb

require 'twitter'

class PostsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    # Replace 'username' with the Twitter username of the account you want to fetch tweets from.
    username = 'username'

    # Keywords related to finances
    finance_keywords = ['%inance', '%money', '%purchase', '%investment', '%buy']

    tweets = client.user_timeline(username, count: 50, tweet_mode: 'extended')

    # Filter tweets containing finance keywords
    @posts = tweets.select { |tweet| finance_keywords.any? { |kw| tweet.full_text.downcase.include?(kw) } }
  end
end
