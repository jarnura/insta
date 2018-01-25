class UsersController < ApplicationController
  def index
  	@user = User.all
    @count = Image.where(user_id: session[:user_id]).length
  end

  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
		if @user.save
			redirect_to sessions_path, :notice => "sucessfully created"
		else
			render "new"
		end
  end
  def subs
    @user = User.find(session[:user_id])
    @followees = @user.followees(User)
    trav = 0
    @followees.each do |f|
      if trav == 0
        @images = Image.where(user_id: f.id)
      else
        @images = @images + Image.where(user_id: f.id)
      end
      trav += 1
    end
    if !@images.nil?
      @images = @images.sort_by{|s| -s[:id]}
    end
  end
  def unsub
    @user = User.find(params[:id])
    User.find(session[:user_id]).unfollow!(@user)
    redirect_to @user
  end 
  def sub
    @user = User.find(params[:id])
    User.find(session[:user_id]).follow!(@user)
    redirect_to @user
  end
  def show
    @user = User.find(params[:id])
  end
  def list
    @users = User.all
  end
  def user_params
		params.require(:user).permit(:name,:email, :password)
	end
end