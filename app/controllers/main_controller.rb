class MainController < ApplicationController

  def index
  end

 

  def bouncer
  end

  def store_most
    @stores = Store.joins(:albums).group("albums.store_id").order("count(albums.store_id) desc").limit(1)
    render 'most'
  end


end

