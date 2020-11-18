class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create

  end

  def index
    @contracts = Contract.all
  end

  def destroy
    @contract = Contract.find(params[:id])
    @boxbike = @contract.boxbike
    @contract.destroy
    redirect_to boxbike_path(@boxbike)
  end

end
