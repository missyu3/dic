class BlogsController < ApplicationController
    def show
        @blog = Blog.find_by(id: params[:id])
        @user = User.find_by(id: @blog.user_id)
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

end
