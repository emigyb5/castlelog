class LogsController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  
  def show
    @log = Log.find(params[:id])
    @logs = Log.order(id: :desc).page(params[:page])
  end

  def create
    @log = current_user.logs.build(logs_params)
    if @log.save
      flash[:success] = 'Logを投稿しました。'
      redirect_back(fallback_location: "/")
    else
      flash.now[:danger] = 'Logの投稿に失敗しました。'
      redirect_back(fallback_location: "/")
    end
  end

  def destroy
    @log.destroy
    flash[:success] = 'Logを削除しました。'
    redirect_back(fallback_location: "/")
  end
  
  private

  def logs_params
    params.require(:log).permit(:title, :image, :comment, :tag, :url)
  end
  
  def correct_user
    @log = current_user.microposts.find_by(id: params[:id])
    unless @log
      redirect_to root_path
    end
  end
end
