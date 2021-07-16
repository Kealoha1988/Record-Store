class AlbumsController < ApplicationController

  def new
    if not_auth_for_new
      redirect_to '/bouncer'
    else
    current_store
    @album = @store.albums.build
    end
  end

  
  def create
    current_store
    @album = @store.albums.build(album_params)
    if @album.save
      redirect_to store_path(@store)
    else
      album_errors
      render :new
    end
  end
  
  def index
    @artist = Artist.all
    if params[:store_id]
      find_store
      @albums = @store.albums.by_format
    else
      @albums = Album.all
      @stores = Store.all
  end
end
  
  def show
    @album = Album.find_by(id: params[:id])
  end
  
  
def edit
  if not_auth_for_edit
    redirect_to '/bouncer'
   else
     current_store
     find_album
     edit_album_path(@album)
   end
  end


  def update
    find_album
    current_store
      @album.update(album_params)
      if @album.save
        redirect_to store_albums_path(current_store)
    else
      album_errors
      render :edit
    end
  end


  def add  
    if the_current_user == nil
      redirect_to root_path
    else
    @album = Album.find_by(id: params[:album_id])
    @album.user = the_current_user
    @album.save
      redirect_to '/cart'
  end
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


  def not_auth_for_new
    no_one_logged_in || current_user_logged_in || find_store == nil
  end

   def not_auth_for_edit
    no_one_logged_in || current_user_logged_in || !current_store.albums.include?(Album.find_by(id: params[:id])) 
   end


  def album_errors
    flash.now[:error] = @album.errors.full_messages
  end


end

# def no_one_logged_in
#   session[:user_id] == nil and  session[:store_id] == nil
# end

# def user_logged_in
#   !!session[:user_id] == true
# end

# def not_store_album
#   session[:store_id] != Album.find_by(id: params[:id]).store.id
# end


#   def find_album
#     @album = Album.find_by(id: params[:id])
#   end