class BoxbikesController < ApplicationController
skip_before_action :authenticate_user!, only: :index

  def index
    @boxbikes = policy_scope(Boxbike).order(created_at: :desc)
    authorize @boxbikes
  end

  def new
    @boxbike = Boxbike.new
    authorize @boxbike
  end

  def create
    @boxbike = Boxbike.new(boxbike_params)
    @boxbike.user = current_user
    authorize @boxbike
    if @boxbike.save
      redirect_to boxbike_path(@boxbike)
    else
      render :new
    end
  end

  def show
    @boxbike = Boxbike.find(params[:id])
    authorize @boxbike
  end

  def edit
    @boxbike = Boxbike.find(params[:id])
    authorize @boxbike
  end

  def update
    @boxbike = Boxbike.find(params[:id])
    authorize @boxbike
    if @boxbike.update(boxbike_params)
      redirect_to boxbike_path
    else
      render :edit
    end
  end

  def destroy
    @boxbike = Boxbike.find(params[:id])
    @boxbike.destroy
    redirect_to boxbikes_path
    authorize @boxbike
  end

  private

  def boxbike_params
    params.require(:boxbike).permit(:address, :capacity, :price, :charge_option)
  end
end
