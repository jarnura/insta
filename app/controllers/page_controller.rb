class PageController < ApplicationController
  def index
  	@images = Image.all
  end
end
