class FirmsController < ApplicationController
  before_action :set_firm, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @firms = Firm.all
  end

  def new
    @firm = Firm.new
    @representative = @firm.build_representative
    @function = @representative.build_function
  end

  def create
    @firm = Firm.new(firm_params)
    @representative = @firm.representative
    @function = @representative.function
    if @firm.valid?
      @firm.save
      redirect_to firm_path(@firm),
        notice: 'Employeur was successfully created.'
    else
      render :new
    end
  end

  def edit
    @representative = @firm.representative.present? ?
      @firm.representative : @firm.build_representative
    @function = @representative.function.nil? ?
      @representative.build_function  : @representative.function
  end

  def update
    if @firm.valid?
      @firm.update(firm_params)
      redirect_to firm_path(@firm),
        notice: 'Employeur was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @representative = @firm.representative
    @function = @representative.try(:function)
  end

  def destroy
    @firm.destroy
    redirect_to firms_path,
      notice: 'Employeur was successfully destroyed.'
  end

  def set_firm
    @firm = Firm.find(params[:id])
  end

  def firm_params
    params.require(:firm).permit(Firm.attribute_names.map(&:to_sym),
    representative_attributes: [:id, :firstname, :lastname, :_destroy,
    function_attributes: [:id, :title, :_destroy]
    ])
  end
end
