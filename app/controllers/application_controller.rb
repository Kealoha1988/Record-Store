class ApplicationController < ActionController::Base


  def cart
    if no_one_logged_in || !!current_store
      redirect_to '/bouncer'
    else
    the_current_user
    @price = @current_user.albums.map{|a| a.price}.sum
    end
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

  def remove
   redirect_if_not_logged_in
    the_current_user
    find_album
    @album.user = nil
    @album.save
      redirect_to '/cart'
  end


private

 # app methods

def no_one_logged_in
  session[:user_id] == nil and  session[:store_id] == nil
end


 #store methods

  def current_store
    @store ||= Store.find_by_id(session[:store_id]) if session[:store_id]
  end

  def find_store
    @store = Store.find_by(id: params[:store_id])
  end

  def store_logged_in?
    !current_store == nil
  end

  def if_store_exists
    Store.all.include?(Store.find_by(id: params[:id]))
  end
  
  def redirect_if_not_logged_in_store
    if !store_logged_in?
      redirect_to '/bouncer'
    end
  end

  def redirect_if_not_store
    if @store == nil || @store.id != Store.find_by_id(params[:id])
      redirect_to '/bouncer'
    end
  end

# album methods

def no_one_logged_in
  session[:user_id] == nil and  session[:store_id] == nil
end

def user_logged_in
  !!session[:user_id] == true
end

def not_store_album
  session[:store_id] != Album.find_by(id: params[:id]).store.id
end


  def find_album
    @album = Album.find_by(id: params[:id])
  end

# user methods
def if_user_exists
  User.all.include?(User.find_by(id: params[:id]))
end

 
 def the_current_user
   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
 end


 def current_user_logged_in
  !!session[:user_id] == true
end


  def user_logged_in?
    !!the_current_user
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
