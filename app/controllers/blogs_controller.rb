class BlogsController < ApplicationController
  def show
      @blog = Blog.find_by(id: params[:id])
  end
  def new
    @blog = Blog.new
  end
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'ブログを編集しました.'
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: '投稿を削除しました'
  end

  private
  def blog_params
    params.require(:blog).permit(:content)
  end
end
