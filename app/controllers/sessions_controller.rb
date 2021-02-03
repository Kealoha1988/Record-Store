class SessionsController < ApplicationController

  def create
    @store = Store.find_buy(name: params[:name])
    if !!@store && @store.authenticate(params[:password])
      session[:store_id] = @store.id
      redirect_to store_path
    else
      message = "Please make sure the storename and password are correct!!"
      redirect_to login_path, notice: message
    end
  end

  def destroy
    session.delete :store_id
  end

end
