class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @contracts = Contract.all
  end

  def new
    @contract = Contract.new
    @collabs = Firm.first.try(:simple_collabs)
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.valid?
      @contract.save
      redirect_to contract_path(@contract),
      notice: 'Contract was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contract.valid?
      @contract.update(contract_params)
      redirect_to contract_path(@contract),
      notice: 'Contract was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @collab =  @contract.collab
    @function =  @contract.collab.function
    @firm = Firm.first

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
          template: "contracts/show.pdf.erb",
          locals: {
            contract: @contract,
            collab: @collab,
            function: @function,
            firm: @firm
          }
      end
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_path,
      notice: 'Contract was successfully destroyed.'
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(Contract.attribute_names.map(&:to_sym))
  end
end
