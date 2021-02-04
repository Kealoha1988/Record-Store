class SessionsController < ApplicationController

  def create
    @store = Store.find_by(name: params[:name])
    if !!@store && @store.authenticate(params[:password])
      session[:store_id] = @store.id
      redirect_to store_path(@store)
    elsif
      @user = User.find_by(username: params[:username])
      if !!@user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
  
        redirect_to user_path(@user)
    else
      flash.now[:error] = "We have exactly  books available."
      render :login
    end
    end
  end

  def user_create
    @user = User.find_by(email: params[:email]) 
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      flash.now[:error] = "We have exactly  books available."
      render :user_login
   
  end
end

  def destroy
    session.clear
    redirect_to root_path
end

end
