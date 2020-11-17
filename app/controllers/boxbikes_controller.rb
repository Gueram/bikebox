class BoxbikesController < ApplicationController
  def index
    @boxbikes = Boxbike.all
  end

  def new
    @user = User.find(params[:user_id])
    @boxbike = Boxbike.new
  end

  def create
    @user = User.find(params[:user_id])
  end
end
