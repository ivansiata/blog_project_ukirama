class UsersController < ApplicationController
  include UsersHelper
  before_action :logged_in_user, except: [:new, :create, :show]
  before_action :check_permission, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      flash[:success] = "User #{@user.name} created!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def check_permission
    @user = User.find(params[:id])
    if @current_user != @user
      flash[:danger] = "Youre not permitted to access the page"
      redirect_to users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:success] = "User '#{@user.name}' was updated!"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User '#{@user.name}' destroyed!"
    redirect_to users_path
  end



end
