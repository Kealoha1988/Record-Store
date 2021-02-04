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
  logged_in_store
end

def update
  logged_in_store
  @store.update(store_params)
  if @store.save
    redirect_to store_path(@store)
  else
    render :edit
  end
end


def destroy
  logged_in_store
  @store.destroy
  redirect_to new_store_path
end

private

def store_params
  params.require(:store).permit(:name, :password, :address, :bio)
end

def logged_in_store
  @store = Store.find_by(id: session[:store_id])
end


end
