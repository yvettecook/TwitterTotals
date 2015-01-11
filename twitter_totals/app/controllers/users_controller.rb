class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.create(params[:name])
    redirect_to user_path(@user)
  end

  def show
  end


end
