class MainController < ApplicationController

  def index
  end

 
  def remove
    redirect_if_not_logged_in
    the_current_user
    find_album
    @album.user = nil
    @album.save
      redirect_to '/cart'
  end

  def bouncer
  end


end