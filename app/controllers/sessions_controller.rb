class SessionsController < ApplicationController
  
  skip_before_action :logged_in?
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Succes to Login'
      redirect_to user_path(user.id)
    else
      flash[:danger] = 'Fail to Login'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end  
  
end
