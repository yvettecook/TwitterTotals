class HomeController < ApplicationController

  def index
    @user = $twitter.user('ynzc')
  end

end
