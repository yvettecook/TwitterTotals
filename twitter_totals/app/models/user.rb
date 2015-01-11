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
      tweets_vs_retweets
    end
  end

  def more_than_200_retweets
    oldest_rt_id = @all_retweets.last.id
    # oldest_rt_date = @all_retweets.last.created_at
  end

  def own_tweets_count
    without_rt = $twitter.user_timeline('ynzc', options={:include_rts => false, :since => 364392548598427649, :count => 200})
    without_rt.length
  end


end
