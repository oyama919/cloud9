class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end
  
  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path,notice:"ブログ作成しました！"
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを更新しました！"
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end
  
  private
    def blogs_params
      params.require(:blog).permit(:title,:content)
    end
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
