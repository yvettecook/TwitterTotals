require 'twitter'
require_relative './concerns/twitter_client'

class User < ActiveRecord::Base

  include TwitterClient

  after_create :on_creation

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
    tweets = non_rts.length
  end

  def rts_in_range_count
    all_tweets = last_cent_tweets.count
    retweets = all_tweets - non_rts_in_range_count
  end

  def calculate_retweet_percentage
    tweets = self.tweets
    retweets = self.retweets
    total = (tweets + retweets) / 1.00
    percentage = (retweets / total) * 100.0
  end

  def calculate_narcissism_score
    diff_from_perfect = (50 - calculate_retweet_percentage).abs
    points_diff = diff_from_perfect * 0.2
    narcissism_score = 10 - points_diff
  end

  private

    def on_creation
      self.update_attribute(:tweets, non_rts_in_range_count)
      self.update_attribute(:retweets, rts_in_range_count)
      self.update_attribute(:narcissism_score, calculate_narcissism_score)
    end

    def api_check
      puts "Being created, taking time"
    end

end
