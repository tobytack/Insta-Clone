class FavoritesController < ApplicationController
    
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "To Favorites #{favorite.blog.user.name}'s Blog"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "Favorite Cancel m#{favorite.blog.user.name}'s Blog"
  end    
    
end
