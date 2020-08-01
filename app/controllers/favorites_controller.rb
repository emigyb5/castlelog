class FavoritesController < ApplicationController
  def create
    log = Log.find(params[:log_id])
    current_user.favorite(log)
    flash[:success] = '投稿をお気に入りに追加しました'
    redirect_back(fallback_location: "/")
  end

  def destroy
    log = Log.find(params[:log_id])
    current_user.unfavorite(log)
    flash[:success] = '投稿をお気に入りから外しました'
    redirect_back(fallback_location: "/")
  end
end
