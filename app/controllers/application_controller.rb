class ApplicationController < ActionController::Base
  private

  def store_params
    params.require(:store).permit(:name, :password, :address, :bio)
  end
  
  def logged_in_store
    @store = Store.find_by(id: session[:store_id])
  end
end
