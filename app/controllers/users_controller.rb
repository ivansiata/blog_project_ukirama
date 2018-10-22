class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)

    flash.notice = "User '#{@user.name}' was updated!"

    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.notice = "User '#{@user.name}' destroyed!"
    redirect_to users_path
  end


end
