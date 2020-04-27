class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :destroy]
  def index
    @blogs = Blog.all
  end

  def show
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

end
