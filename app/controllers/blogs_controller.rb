class BlogsController < ApplicationController
  before_action :set_params, only: [:edit, :show, :destroy]

  def new
    @blog = Blog.new
  end

  def edit; end

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

  def index
    @blogs = Blog.all
  end

  def show; end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_params
    @blog = Blog.find(params[:id])
  end
end
