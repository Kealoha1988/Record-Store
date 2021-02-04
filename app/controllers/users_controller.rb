class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end
  
  def index
    @users = User.all.order(name: :asc)
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    logged_in_user
  end
  
  def update
    logged_in_user
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  
  def destroy
    logged_in_user
    @user.destroy
    redirect_to new_user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :image)
  end
  
  def logged_in_user
    @user = User.find_by(id: session[:user_id])
  end
  
  
  end
