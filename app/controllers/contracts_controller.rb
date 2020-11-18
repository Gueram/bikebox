class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create

  end

  def index
    @contracts = Contract.all
  end

end
