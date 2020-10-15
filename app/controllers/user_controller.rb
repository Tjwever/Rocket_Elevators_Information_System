class UserController < ApplicationController
 # before_action :set_user, only [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show

  end

  def edit

  end

  def destroy

  end

  def update
    @user_destroy
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
