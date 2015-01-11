require 'twitter'

class User < ActiveRecord::Base

  def twitter_user
    $twitter.user(self.name)
  end

  def followers_count
    twitter_user.followers_count
  end

end
