require 'twitter'

module TwitterClient
  extend ActiveSupport::Concern

  include do
    before_filter :say_hi, :twitter
  end

  def say_hi
    return "HI!"
  end

  def twitter
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key         = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret      = Rails.application.secrets.twitter_consumer_secret
      config.access_token         = Rails.application.secrets.twitter_access_token
      config.access_token_secret  = Rails.application.secrets.twitter_access_token_secret
    end
    puts "YO! Twitter API is configured"
    return @twitter
  end

end
