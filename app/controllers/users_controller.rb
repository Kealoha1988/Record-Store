class UsersController < ApplicationController
  
  def new
    @current_user = User.new
  end
  
  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    else
      user_errors
      render :new
    end
  end
  
  def index
    @users = User.all.order(name: :asc)
  end
  
  def show
    if no_one_logged_in || !if_user_exists
      redirect_to '/bouncer'
    else
      the_current_user
    end
  end
  
  def edit
    auth_user
  end
  
  def update
    the_current_user
    @current_user.update(user_params)
    if @current_user.save
      redirect_to user_path(@current_user)
    else
      user_errors
      render :edit
    end
  end
  
  
  def destroy
    the_current_user
    session.clear
    @current_user.destroy
    redirect_to root_path
  end



  


  private
  
  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :image)
  end
  
  def logged_in_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def find_user
    @current_user = User.find_by(id: params[:id])
  end

  def auth_user
    if no_one_logged_in || !if_user_exists || find_user != logged_in_user
      redirect_to '/bouncer'
      # elsif find_user != logged_in_user
      #   redirect_to '/bouncer'
      else
        the_current_user
      end
  end

  def user_errors
    flash.now[:error] = @current_user.errors.full_messages
  end

end

  # In the app controller
  
#  def the_current_user
#   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
# end


# def current_user_logged_in
#  !!session[:user_id] == true
# end


#  def user_logged_in?
#    !!the_current_user
#  end
 
 
#  def redirect_if_not_logged_in
#    if !user_logged_in?
#      redirect_to '/bouncer'
#    end
#  end

#  def redirect_if_not_user
#    if @current_user.nil? || @current_user != User.find_by_id(params[:id])
#      redirect_to '/bouncer'
#    end
#  end

