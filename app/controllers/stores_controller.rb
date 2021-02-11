class StoresController < ApplicationController
  before_action :find_store, only: [:show, :edit, :update]


def new
  @store = Store.new
end


def create
  @store = Store.new(store_params)
  if @store.save
    session[:store_id] = @store.id
    redirect_to store_path(@store)
  else
    store_errors
    render :new
  end
end


def index
  @stores = Store.all.order(name: :asc)
end


def show
  if !if_store_exists
    redirect_to '/stores'
  else
  find_store
  end 
end


def edit
  auth_store
end


def update
  @store.update(store_params)
  if @store.save
    redirect_to store_path(@store)
  else
    store_errors
    render :edit
  end
end


def destroy
  current_store
  delete_all
  session.clear
  @store.destroy
  redirect_to root_path
end






private

def store_params
  params.require(:store).permit(:name, :password, :address, :bio, :image)
end

def find_store
  @store = Store.find_by(id: params[:id])
end

def logged_in_store
  @store = Store.find_by(id: session[:store_id])
end

def auth_store
  if no_one_logged_in
    redirect_to '/bouncer'
  elsif find_store != logged_in_store
    redirect_to '/bouncer'
  else
    current_store
  end
end

def delete_all
  if !!@store.albums
    @store.albums.each do |d|
      d.destroy
    end
  end
end

def store_errors
  flash.now[:error] = @store.errors.full_messages
end


end

# def current_store
#   @store ||= Store.find_by_id(session[:store_id]) if session[:store_id]
# end

# def find_store
#   @store = Store.find_by(id: params[:store_id])
# end

# def store_logged_in?
#   !current_store == nil
# end


# def redirect_if_not_logged_in_store
#   if !store_logged_in?
#     redirect_to '/bouncer'
#   end
# end

# def redirect_if_not_store
#   if @store == nil || @store.id != Store.find_by_id(params[:id])
#     redirect_to '/bouncer'
#   end
# end
