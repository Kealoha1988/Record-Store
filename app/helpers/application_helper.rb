module ApplicationHelper

def logged_in?
  !!session[:store_id]
end

def current_store
  @cureent_store ||= Store.fund_by(id: session[:store_id]) if !!session[:store_id]
end

end
