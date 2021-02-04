class AlbumsController < ApplicationController
 
  
  def new
    find_store
    @album = @store.albums.build
   

  end
  
  def create
    logged_in_store
    @album = @store.albums.build(album_params)
    @album.artist = @artist
    
    
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
    logged_in_store
  end
  
  def update
    find_album
    logged_in_store
    @album.update(album_params)
    if @album.save
      redirect_to store_albums_path(logged_in_store)
    else
      render :edit
    end
  end
  
  
  def destroy
    find_album
    @album.destroy
    redirect_to new_album_path
  end
  
  private
  
  def album_params
    params.require(:album).permit(:title, :format, :label, :release_date, :store_id, :genre_id, :artist_id, :price, :user_id, artist_attributes: [:name])
  end

  def find_store
    @store = Store.find_by(id: params[:store_id])
  end

  def find_album
    @album = Album.find_by(id: params[:id])
  end



end
