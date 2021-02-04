class AlbumsController < ApplicationController
 
  
  def new
    find_store
    @album = @store.albums.build
   

  end
  
  def create
    @store = Store.find_by(id: session[:store_id])
    @album = @store.albums.build(album_params)
    
    
    if @album.save
  
      redirect_to store_path(@store)
    end
  end
  
  def index
    @artist = Artist.all
    if params[:store_id]
    @store = Store.find_by(id: params[:store_id])
    @albums = @store.albums
    else
      @albums = Album.all
      @stores = Store.all
  end
end
  
  def show
    find_album
    
  end
  
  def edit
    find_album
    if user_logged_in?
      current_user
    end
  end
  
  def update
    find_album
    if store_logged_in?
      logged_in_store
      @album.update(album_params)
      if @album.save
        redirect_to store_albums_path(logged_in_store)
  
    else
      render :edit
    end
  end
  end

  def add
    @album = Album.find_by(id: params[:album_id])
    user_logged_in?
    @album.user = current_user
    @album.save
      redirect_to '/cart'
  end
  
  
  def destroy
    find_album
    @album.destroy
    redirect_to new_album_path
  end

  def remove
    byebug
    find_album
    user_logged_in?
    @album.user = nil
    @album.save
      redirect_to '/cart'
  end

  
  private
  
  def album_params
    params.require(:album).permit(:title, :format, :label, :release_date, :store_id, :genre_id, :artist_id, :price, :user_id)
  end

  def find_store
    @store = Store.find_by(id: params[:store_id])
  end





end
