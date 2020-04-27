class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end
  def edit
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
    params.require(:blog).permit(:content, :title)
  end
end
