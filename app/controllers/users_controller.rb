class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :favorite]
  
  def show
    @user = User.find(params[:id])
    @log = current_user.logs.build
    @logs = @user.logs.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = current_user
    @user.destroy
    flash[:success] = '退会しました。'
    redirect_to root_path
  end
  
  def likes
    @user = User.find(params[:id])
    @logs = @user.favorite_logs.page(params[:page])
    @likes = @logs
    counts(@user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
