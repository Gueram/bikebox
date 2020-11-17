class BoxbikesController < ApplicationController
  def index
    @boxbikes = Boxbike.all
  end

  def show
    @boxbike = Boxbike.find(params[:id])
  end

end
