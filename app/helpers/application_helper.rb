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


def redirect_if_not_logged_in
  if !logged_in?
    redirect_to '/bouncer'
  end
end

def user_redirect_if_not_you
  if @user.nil? || @user != User.find_by_id(params[:id])
    redirect_to '/bouncer'
  end
end

def store_redirect_if_not_you
  if @store.nil? || @store != Store.find_by_id(params[:id])
    redirect_to '/bouncer'
  end
end

# def redirect_if_not_yours
#   if @bag.nil? || @bag.user.nil? || @bag.user != current_user
#     redirect '/bouncer'
#   end
# end

end
