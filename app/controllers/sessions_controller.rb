class SessionsController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	user = User.where(:name => params[:session][:name].downcase).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to images_path
    else
    	redirect_to sessions_path
    	 flash[:danger] = 'Invalid username/password combination' # Not quite right!
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end
