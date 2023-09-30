class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def top
  end
  
  def index
  end

  def show
    @ntt = "ちんこ"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end