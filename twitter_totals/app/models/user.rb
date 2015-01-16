require 'twitter'
require_relative './concerns/twitter'

class User < ActiveRecord::Base

  include TwitterClient

  def twitter_client
    @twitter_client ||= self.twitter
  end

  def twitter_user
    @twitter_user ||= twitter_client.user(self.name)
  end

  def fullname
    twitter_user.name
  end

  def narcissism_score
    calculate_narcissism_score
  end

  def last_cent_tweets
    twitter_client.user_timeline(name, options={:include_rts => true, :count => 100})
  end

  def last_cent_tweet_id
    last_cent_tweets.last.id
  end

  def non_rts
    twitter_client.user_timeline(name, options={:include_rts => false, :since => self.last_cent_tweet_id, :count => 100})
  end

  def non_rts_in_range_count
    self.tweets = non_rts.length
  end

  def rts_in_range_count
    all_tweets = last_cent_tweets.count
    self.retweets = all_tweets - non_rts_in_range_count
  end

  def calculate_retweet_percentage
    tweets = non_rts_in_range_count
    retweets = rts_in_range_count
    total = (tweets + retweets) / 1.00
    percentage = (retweets / total) * 100.0
  end

  def calculate_narcissism_score
    diff_from_perfect = (50 - calculate_retweet_percentage).abs
    points_diff = diff_from_perfect * 0.2
    self.narcissism_score = 10 - points_diff
  end

end
