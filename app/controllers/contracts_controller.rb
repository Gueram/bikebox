class ContractsController < ApplicationController
  def index
    @boxbike = Boxbike.find(params[:boxbike_id])
    @contracts = @boxbike.contracts
    @contracts = policy_scope(Contract).order(created_at: :desc)
  end

  def new
    @contract = Contract.new(contract_params)
    authorize @contract
  end

  def create
    @contract = Contract.new(contract_params)
    @boxbike = Boxbike.find(params[:boxbike_id])
    @contract.boxbike = @boxbike
    @contract.user = current_user
    authorize @contract
    if @contract.save
      redirect_to boxbike_contracts_path(@boxbike)
    else
      redirect_to boxbike_path(@boxbike)
      flash[:notice] = "Warning, your rental didn't go through, please review the form."
    end
  end

  private
  def contract_params
    params.require(:contract).permit(:start_date, :end_date, :number_bikes, :status)
  end
end
