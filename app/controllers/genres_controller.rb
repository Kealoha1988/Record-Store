class GenresController < ApplicationController
  
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    end
  end
  
  def index
    @genres = Genre.all
  end
  
  def show
    @genre = Genre.find_by(id: params[:id])
  end
  
  def edit
    @genre = Genre.find_by(id: params[:id])
  end
  
  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.update(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end
  
  
  def destroy
    @genre = Genre.find_by(id: params[:id])
    @genre.destroy
    redirect_to new_genre_path
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end

end
