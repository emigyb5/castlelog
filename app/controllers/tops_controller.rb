class TopsController < ApplicationController
  def index
    @logs = Log.all.order(id: :desc).page(params[:page])
  end
end
