class BoxbikesController < ApplicationController
  def index
    @boxbikes = Boxbike.all
  end

  def new
    @boxbike = Boxbike.new
  end

  def create
    @boxbike = Boxbike.new(boxbike_params)
    if @boxbike.save
      redirect_to boxbike_path(@boxbike)
    else
      render :new
    end
  end

  private

  def boxbike_params
    params.require(:boxbike).permit(:address, :capacity, :price, :charge_option)
  end
end
