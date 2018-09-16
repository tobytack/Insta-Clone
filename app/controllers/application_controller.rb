class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :logged_in?
  

  
  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end  
  
end
