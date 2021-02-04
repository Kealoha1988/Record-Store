class MainController < ApplicationController

  def index
  end

 
  def remove
    find_album
    user_logged_in?
    @album.user = nil
    @album.save
      redirect_to '/cart'
  end


end