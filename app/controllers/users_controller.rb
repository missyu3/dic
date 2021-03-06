class UsersController < ApplicationController
  before_action :set_params, only: [:edit, :update, :show, :destroy]
  skip_before_action :login_required,only: [:new, :create]

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_mypage_path(@user.id), notice: "ユーザーを登録しました！"
    else
      flash.now[:danger] = "ユーザー登録に失敗しました！"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_mypage_path(@user.id), notice: "ユーザー情報を更新しました！"
    else
      flash.now[:danger] = "ユーザー情報の更新に失敗しました！"
      render :edit
    end
  end

  def show; end

  def destroy
    session.delete(:user_id)
    @user.destroy
    redirect_to new_session_path, notice: "ユーザーを削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_params
    @user = User.find(params[:id])
  end
end
