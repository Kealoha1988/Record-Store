class ApplicationController < ActionController::Base


  def cart
    redirect_if_not_logged_in
    the_current_user
    
  end

  def add_to_cart
    redirect_if_not_logged_in
    the_current_user
    @album.user_id = current_user.id
    if @album.save
    redirect_to '/cart'
    else
      redirect_to user_path(current_user)
  end
end


private

  def store_logged_in?
    !!current_store
  end
  
  def current_store
    @store ||= Store.find_by_id(session[:store_id]) if session[:store_id]
  end
  
  def redirect_if_not_logged_in_store
    if !store_logged_in?
      redirect_to '/bouncer'
    end
  end

  def redirect_if_not_store
    if @store.nil? || @store != Store.find_by_id(params[:id])
      redirect_to '/bouncer'
    end
  end

 







  def find_album
    @album = Album.find_by(id: params[:id])
  end


 


  def user_logged_in?
    !!the_current_user
  end
  
  def the_current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def redirect_if_not_logged_in
    if !user_logged_in?
      redirect_to '/bouncer'
    end
  end

  def redirect_if_not_user
    if @current_user.nil? || @current_user != User.find_by_id(params[:id])
      redirect_to '/bouncer'
    end
  end





 


end
