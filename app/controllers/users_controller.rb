class UsersController < ApplicationController

  before_action :set_user, only: [:show , :profile ,:profile_edit]
  
  def top
  end
  
  def index
  end

  def show
  end

  def profile
  end

  def profile_edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_profile_path(@user)
    else
      render :profile_edit
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :infomation )
  end

end