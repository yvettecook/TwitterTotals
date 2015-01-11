require 'twitter'

class User < ActiveRecord::Base

  def twitter_user
    $twitter.user(self.name)
  end

  def followers_count
    twitter_user.followers_count
  end

  def following_count
    twitter_user.friends_count
  end

  def tweets_count
    twitter_user.statuses_count
  end

  def retweets_count
    name = self.name
    @all_retweets = $twitter.retweeted_by_user(name, options={:count => 200})
    return @all_retweets.count
  end

  def calculate_narcissism_score
    if self.retweets_count < 200
      score = self.low_RT_narcissism_score
    else
      score = self.high_RT_narcissim_score
    end
    return score.round(2)
  end

  def oldest_rt_in_range_id
    oldest_id = @all_retweets.last.id
  end

  def own_tweets_count
    name = self.name
    last_retweet_id = self.oldest_rt_in_range_id
    without_rt = $twitter.user_timeline(name, options={:include_rts => false, :since => last_retweet_id, :count => 200})
    without_rt.length
  end

  def own_rt_tweets_count
    name = self.name
    last_retweet_id = self.oldest_rt_in_range_id
    without_rt = $twitter.user_timeline(name, options={:include_rts => false, :since => last_retweet_id, :count => 200})
    without_rt.length
  end

  def high_RT_narcissim_score
    tweets = self.own_tweets_count
    score = tweets / 200.0
    return score
  end

  def low_RT_narcissism_score
    all_tweets = $twitter.user_timeline(name, options={:include_rts => false, :count => 200})
    last_tweet_id = all_tweets.last.id
    retweets_since_last_tweet = $twitter.retweeted_by_user(name, options={:since => last_tweet_id, :count => 200})
    retweets_since_count = retweets_since_last_tweet.length
    return 200.0 / retweets_since_count
  end

end
