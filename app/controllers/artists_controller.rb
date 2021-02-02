class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    end
  end
  
  def index
    @artists = Artist.all
  end
  
  def show
    @artist = Artist.find_by(id: params[:id])
  end
  
  def edit
    @artist = Artist.find_by(id: params[:id])
  end
  
  def update
    @artist = Artist.find_by(id: params[:id])
    @artist.update(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end
  
  
  def destroy
    @artist = Artist.find_by(id: params[:id])
    @artist.destroy
    redirect_to new_artist_path
  end
  
  private
  
  def artist_params
    params.require(:artist).permit(:name)
  end
end
