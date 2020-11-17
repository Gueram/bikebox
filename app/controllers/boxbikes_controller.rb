class BoxbikesController < ApplicationController
skip_before_action :authenticate_user!, only: :index

  def index
    @boxbikes = Boxbike.all
  end

  def show
    @boxbike = Boxbike.find(params[:id])
  end

end
