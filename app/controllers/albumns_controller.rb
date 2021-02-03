class AlbumnsController < ApplicationController
  
  def new
    @store = Store.find_by(id: params[:store_id])

    @albumn = @store.albumns.build

  end
  
  def create
    @artist = Artist.find_or_create_by(name: params[:name])
    byebug
    @albumn.artist_id = @artist.id
    @albumn = Store.albums.build(albumn_params)


    if @albumn.save
      redirect_to store_albums_path(@albumn)
    end
  end
  
  def index
    @albumns = Albumn.all
  end
  
  def show
    @albumn = Albumn.find_by(id: params[:id])
  end
  
  def edit
    @albumn = Albumn.find_by(id: params[:id])
  end
  
  def update
    @albumn = Albumn.find_by(id: params[:id])
    @albumn.update(album_params)
    if @albumn.save
      redirect_to store_albumns_path(@albumn)
    else
      render :edit
    end
  end
  
  
  def destroy
    @albumn = albumn.find_by(id: params[:id])
    @albumn.destroy
    redirect_to new_albumn_path
  end
  
  private
  
  def albumn_params
    params.require(:albumn).permit(:title, :artist, :format, :label, :release_date, :store_id, :genre_id, :artist_id, :price, :user_id)
  end
end
