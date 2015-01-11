require 'twitter'

class User < ActiveRecord::Base

  def followers_count
    return $twitter.user(self.name).followers_count
  end

end
