class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.where('id = ?', params[:id])
  end
end
