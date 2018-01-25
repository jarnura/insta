class ImagesController < ApplicationController
	def index
		@images = Image.all
		@user = User.find(session[:user_id])
		respond_to do |wants|
            wants.html # index.html.erb
            wants.xml  { render :xml => @images }
            wants.json { render :json => @images }
        end
        
	end

	def new
		@image = Image.new
		
	end

	def create

		@image = Image.create( image_params )
		@image.user_id = session[:user_id]
		if @image.save
			ActionCable.server.broadcast 'web_notifications_channel', message: 'hi2'
			redirect_to images_path
		else
			render 'new'
		end
	end

	def image_params
		params.require(:image).permit(:user_id, :pic)
	end
end
