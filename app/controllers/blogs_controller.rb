class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  
end
