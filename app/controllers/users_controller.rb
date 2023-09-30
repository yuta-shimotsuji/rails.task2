class UsersController < ApplicationController

  before_action :set_user, only: [:show , :profile]
  def top
  end
  
  def index
  end

  def show
  end

  def profile
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end