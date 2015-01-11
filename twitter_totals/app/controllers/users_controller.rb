class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @followers_count = @user.followers_count
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
