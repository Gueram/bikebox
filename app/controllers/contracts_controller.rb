class ContractsController < ApplicationController
  def index
    @contracts = Contract.all
  end
  
  def new
  end

  def create
    @contract = Contract.new(contract_params)
    @boxbike = Boxbike.find(params[:boxbike_id])
    @contract.boxbike = @boxbike
    @contract.user = current_user
    if @contract.save
      redirect_to boxbike_path(@boxbike)
    else
      redirect_to boxbike_path(@boxbike)
      flash[:notice] = "Attention, le contrat n'est pas créé"
    end
  end
  
  private
  def contract_params
    params.require(:contract).permit(:start_date, :end_date, :number_bikes, :status)
  end
end
