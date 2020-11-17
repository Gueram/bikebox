class BoxbikesController < ApplicationController
skip_before_action :authenticate_user!, only: :index

  def index
    @boxbikes = Boxbike.all
  end

  def new
    @boxbike = Boxbike.new
  end

  def create
    @boxbike = Boxbike.new(boxbike_params)
    @boxbike.user = current_user
    if @boxbike.save
      redirect_to boxbike_path(@boxbike)
    else
      render :new
    end
  end

  def show
    @boxbike = Boxbike.find(params[:id])
  end

  private

  def boxbike_params
    params.require(:boxbike).permit(:address, :capacity, :price, :charge_option)
  end
end
