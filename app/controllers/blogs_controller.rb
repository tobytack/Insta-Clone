class BlogsController < ApplicationController
  
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :list]
  before_action :require_login
  
  def index
    #@blogs = current_user.blogs.all
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id #現在ログインしているuserのidをblogのuser_idカラムに挿入する
    if @blog.save
      
       @user = current_user
       # deliverメソッドを使って、メールを送信する
       ContactMailer.contact_mail(@user).deliver
       
       # 一覧画面へ遷移して"つぶやきを作成しました！"とメッセージを表示します。
       redirect_to blogs_path, notice: "つぶやきを作成しました！"
       
    else
       # 入力フォームを再描画します。
       render 'new'
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
  end
  
  def top
  end
  
  def update
    if @blog.update(blog_params)
       redirect_to blogs_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"つぶやきを削除しました！"
  end

  private
  
  def require_login
    unless logged_in?
      flash[:notice] = 'Log in してください'
      redirect_to new_session_path
    end
  end  
  
  def blog_params
    params.require(:blog).permit(:content, :user_id, :image, :image_cache)
  end
  
  # idをキーとして値を取得するメソッド
    def set_blog
      #@blog = current_user.blogs.find(params[:id])
      @blog = Blog.find(params[:id])
    end
  
end
