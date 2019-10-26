class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in?

  skip_before_action :logged_in?, only: [:login,:new,:create,:signin, :home]

  def home 
    render "users/home"
  end

  private
  def logged_in? 
    redirect_to "/" unless  session[:user_id]
  end
end
