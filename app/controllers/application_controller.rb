class ApplicationController < ActionController::Base


  def cart
    current_user
  end

  def add_to_cart
    @album.user_id = current_user.id
    if @album.save
    redirect_to '/cart'
    else
      redirect_to user_path(current_user)
  end
end


  def store_params
    params.require(:store).permit(:name, :password, :address, :bio)
  end
  
  def current_store
    @store = Store.find_by(id: session[:store_id])
  end

  def store_logged_in?
    !!Store.find_by(id: session[:store_id])
  end

  def current_user
   @current_user = User.find_by(id: session[:user_id])
  end

  def user_logged_in?
    !!User.find_by(id: session[:user_id])
  end

  def find_album
    @album = Album.find_by(id: params[:id])
  end


  def redirect_if_not_you
    if @user.nil? || @user != User.find_by_id(params[:id])
      redirect '/bouncer'
    end
  end


  def redirect_if_not_store
    if @store.nil? || @store.user.nil? || @store != current_store
      redirect '/bouncer'
    end
  end

 


end
