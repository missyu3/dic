class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:index]
  
  def index
    @blogs = Blog.all
  end

  def show; end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def new
    @blog = Blog.new
  end

  def edit; end
  
  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_url, notice: 'ブログを投稿しました！'
    else
      flash.now[:danger] = "ブログ投稿に失敗しました！"
      render :new
    end
  end
  
  def update
    if current_user.blogs.update(blog_params)
      redirect_to @blog, notice: 'ブログを編集しました！'
    else
      flash.now[:danger] = "ブログの編集に失敗しました！"
      render :edit
    end
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
