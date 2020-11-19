class BoxbikesController < ApplicationController
skip_before_action :authenticate_user!, only: :index

  def index
    @boxbikes = policy_scope(Boxbike).order(created_at: :desc)
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
    @contract = Contract.new
    @contracts = Contract.where(boxbike_id: @boxbike.id)
    @contracts_dates = @contracts.map do |contract|
      {
        from: contract.start_date,
        to:   contract.end_date
      }
    end
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
    authorize @boxbike
    @boxbike.destroy
    redirect_to boxbikes_path
  end

  private

  def boxbike_params
    params.require(:boxbike).permit(:address, :capacity, :price, :charge_option)
  end
end
