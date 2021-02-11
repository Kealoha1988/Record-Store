module ApplicationHelper
  

def store_logged_in?
  !!session[:store_id]
end

def user_logged_in?
  !!session[:user_id]
end

def current_store
  @current_store ||= Store.find_by(id: session[:store_id]) if !!session[:store_id]
end


def current_user
  @current_user ||= User.find_by(id: session[:user_id]) if !!session[:user_id]
end





end
