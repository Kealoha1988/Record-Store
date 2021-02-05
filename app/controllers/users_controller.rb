class UsersController < ApplicationController
  
  def new
    @current_user = User.new
  end
  
  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    else
      flash.now[:error] = @current_user.errors.full_messages
      render :new
    end
  end
  
  def index
    @users = User.all.order(name: :asc)
  end
  
  def show
    @current_user = User.find_by(id: params[:id])
  end
  
  def edit
   @current_user = User.find_by(id: params[:id])
  end
  
  def update
    @current_user = User.find_by(id: session[:user_id])
 
    @current_user.update(user_params)
    if @current_user.save
      redirect_to user_path(@current_user)
    else
      render :edit
    end
  end
  
  
  def destroy
    @current_user = User.find_by(id: params[:id])
    session.clear
    @current_user.destroy
    redirect_to root_path
  end



  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :image)
  end
  
  def logged_in_user
    @user = User.find_by(id: session[:user_id])
  end
  
  
  end
