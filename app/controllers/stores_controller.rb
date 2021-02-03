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
    render :new
  end
end

def index
  @stores = Store.all
end

def show
  @store = Store.find_by(id: params[:id])
end

def edit
  @store = Store.find_by(id: params[:id])
end

def update
  @store = Store.find_by(id: params[:id])
  @store.update(store_params)
  if @store.save
    redirect_to store_path(@store)
  else
    render :edit
  end
end


def destroy
  @store = Store.find_by(id: params[:id])
  @store.destroy
  redirect_to new_store_path
end

private

def store_params
  params.require(:store).permit(:name, :password_digest, :address, :bio)
end


end
