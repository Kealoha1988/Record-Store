class AlbumsController < ApplicationController
  
  def new
    @store = Store.find_by(id: params[:store_id])

    @album = @store.albums.build

  end
  
  def create
    @artist = Artist.find_or_create_by(name: params[:artist])
    byebug
    @album.artist_id = @artist.id
    @album = Store.albums.build(album_params)


    if @album.save
      redirect_to store_albums_path(@album)
    end
  end
  
  def index
    @albums = Album.all
  end
  
  def show
    @album = Album.find_by(id: params[:id])
  end
  
  def edit
    @album = Album.find_by(id: params[:id])
  end
  
  def update
    @album = Album.find_by(id: params[:id])
    @album.update(album_params)
    if @album.save
      redirect_to store_albums_path(@album)
    else
      render :edit
    end
  end
  
  
  def destroy
    @album = album.find_by(id: params[:id])
    @album.destroy
    redirect_to new_album_path
  end
  
  private
  
  def album_params
    params.require(:album).permit(:title, :artist, :format, :label, :release_date, :store_id, :genre_id, :artist_id, :price, :user_id)
  end
end
