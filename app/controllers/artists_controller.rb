class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update]


  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      flash.now[:error] = @artist.errors.full_messages
      render :new
    end
  end
  
  def index
    @artists = Artist.all
  end
  
  def show
    # find_artist
  end
  
  def edit
    # find_artist

  end
  
  def update
    # find_artist
    @artist.update(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      flash.now[:error] = @artist.errors.full_messages
      render :edit
    end
  end
  
  
  private
  
  def artist_params
    params.require(:artist).permit(:name)
  end

  def find_artist
    @artist = Artist.find_by(id: params[:id])
  end

end
