class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end 

  def test_email
    @user = User.first
    UserMailer.welcome_email(@user).deliver
  end
end
