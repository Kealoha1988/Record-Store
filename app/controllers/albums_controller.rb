class AlbumsController < ApplicationController
 
  
  def new
    find_store
    @album = @store.albums.build
   

  end
  
  def create
    current_store
    
    @album = @store.albums.build(album_params)
    
    if @album.save
  
      redirect_to store_path(@store)
    end
  end
  
  def index
    @artist = Artist.all
    if params[:store_id]
    find_store
    @albums = @store.albums
    else
      @albums = Album.all
      @stores = Store.all
  end
end
  
  def show
    @album = Album.find_by(id: params[:id])
    
  end
  
  def edit
    redirect_if_not_logged_in_store
    current_store
    find_album
    if current_store.id == @album.store_id
      edit_album_path(@album)
    else
      redirect_to '/bouncer'
  end
end
  
  def update
    find_album
    current_store
      @album.update(album_params)
      if @album.save
        redirect_to store_albums_path(current_store)
    else
      render :edit
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
    current_store
    find_album
    @album.destroy
    redirect_to '/'
  end


  
  private
  
  def album_params
    params.require(:album).permit(:title, :format, :label, :release_date, :store_id, :genre_id, :artist_id, :price, :user_id)
  end

  def find_store
    @store = Store.find_by(id: params[:store_id])
  end





end
