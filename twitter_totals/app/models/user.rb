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

  def non_rts_in_range
    all_tweets = $twitter.user_timeline(name, options={:include_rts => false, :since => self.last_cent_tweet_id, :count => 100})
    all_tweets.length
  end

end
