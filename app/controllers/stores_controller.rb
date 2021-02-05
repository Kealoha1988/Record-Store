class StoresController < ApplicationController

def new
  @store = Store.new
end

def create
  @store = Store.new(store_params)
  if @store.save
    session[:store_id] = @store.id
    redirect_to store_path(@store)
  else
    flash.now[:error] = @store.errors.full_messages
    render :new
  end
end

def index
  @stores = Store.all.order(name: :asc)
end

def show
  @store = Store.find_by(id: params[:id])
end

def edit
  redirect_if_not_logged_in_store
  current_store
  redirect_if_not_store
end

def update
  redirect_if_not_logged_in_store
  current_store
  redirect_if_not_store
  @store.update(store_params)
  if @store.save
    redirect_to store_path(@store)
  else
    render :edit
  end
end


def destroy
  redirect_if_not_logged_in_store
  current_store
  redirect_if_not_store
  delete_all
  session.clear
  @store.destroy
  redirect_to root_path
end

private

def store_params
  params.require(:store).permit(:name, :password, :address, :bio, :image)
end

def logged_in_store
  @store = Store.find_by(id: session[:store_id])
end


def delete_all
  @store.albums.each do |d|
    d.destroy
  end
end


end
