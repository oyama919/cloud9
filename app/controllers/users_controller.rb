class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @users = User.all
    @followed = User.find(params[:id]).followed_users
    @followers = User.find(params[:id]).followers
  end
end
