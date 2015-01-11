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

  def retweets_check
    name = self.name
    @all_retweets = $twitter.retweeted_by_user(name, options={:count => 200})
    if @all_retweets.count < 200
      @all_retweets.count
    else
      own_tweets_count
    end
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


end
