class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ImagesHelper
  private

def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user

def authorize
    redirect_to sessions_path, alert: "Not authorized" if current_user.nil?
end
end
