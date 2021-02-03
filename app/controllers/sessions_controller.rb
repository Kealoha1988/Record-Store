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

  def destroy
    session.clear
    redirect_to root_path
end

end
