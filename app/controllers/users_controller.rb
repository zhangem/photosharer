class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "A new user has been born."
      redirect_to('/users')
    else
      render('/users/index')
    end
  end

  def show
    @user = User.find(session[:user_id])
  end




private

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation, :first_name, :last_name, :email)
  end
end
