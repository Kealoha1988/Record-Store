class SessionsController < ApplicationController

  def create
    @store = Store.find_by(name: params[:name])
    if !!@store && @store.authenticate(params[:password])
      session[:store_id] = @store.id
      redirect_to store_path(@store)
    else
      flash.now[:error] = "We have exactly  books available."
      render :login
    end
  end

  def user_create
    @current_user = User.find_by(email: params[:email]) 
    if !!@current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id

      redirect_to user_path(@current_user)
    else
      flash.now[:error] = "We have exactly  books available."
      render :user_login
   
  end
end

def google
  @current_user = User.find_or_create_by(username:  auth["info"]["name"], email: auth["info"]["email"], image: auth["info"]["image"]) do |u|
    u.password = SecureRandom.hex(10)

  end
  if !!@current_user && !!@current_user.id
    session[:user_id] = @current_user.id
    redirect_to user_path(@current_user)
  else
    redirect_to root_path
  end
end

  def destroy
    session.clear
    redirect_to root_path
end

private

def auth
  request.env["omniauth.auth"]
end

def user_params
  params.require(:user).premit(:password, :username)
end

end


