require 'twitter'

class User < ActiveRecord::Base

  def twitter_user
    $twitter.user(self.name)
  end

  def last_cent_tweets
    last_cent_tweets ||= $twitter.user_timeline(name, options={:include_rts => true, :count => 100})
  end

  def last_cent_tweet_id
    last_cent_tweets.last.id
  end

  def non_rts
    non_rts ||= $twitter.user_timeline(name, options={:include_rts => false, :since => self.last_cent_tweet_id, :count => 100})
  end

  def non_rts_in_range_count
    non_rts.length
  end

  def rts_in_range_count
    all_tweets = last_cent_tweets.count
    all_tweets - non_rts_in_range_count
  end

  def calculate_retweet_percentage
    tweets = non_rts_in_range_count
    retweets = rts_in_range_count
    total = (tweets + retweets) / 1.00
    percentage = (retweets / total) * 100.0
  end

end
