class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :destroy]
  def index
    @blogs = Blog.all
  end

  def show
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def new
    @blog = Blog.new
  end
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_url, notice: 'ブログを投稿しました'
    else
      render :new
    end
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'ブログを編集しました.'
    else
      render :edit
    end
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
