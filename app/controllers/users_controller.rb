class UsersController < ApplicationController
  
  skip_before_action :logged_in?
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Sign up 成功！　Log in してください'
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @favorite_blogs = @user.favorite_blogs
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end  
end
