class CollabsController < ApplicationController
  before_action :set_collab, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @collabs = Firm.first.try(:simple_collabs)
  end

  def new
    @collab = Collab.new
    @function = @collab.build_function
  end

  def create
    @collab = Collab.new(collab_params)
    @function = @collab.function.present? ?
      @collab.function : @collab.build_function
    if @collab.valid?
      @collab.save
      redirect_to collab_path(@collab),
      notice: 'Collab was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @function = @collab.function.present? ?
      @collab.function : @collab.build_function

    if @collab.valid?
      @collab.update(collab_params)
      redirect_to collab_path(@collab),
      notice: 'Collab was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @function = @collab.function
  end

  def destroy
    @collab.destroy
    redirect_to collabs_path,
      notice: 'Collab was successfully destroyed.'
  end

  def set_collab
    @collab = Collab.find(params[:id])
  end

  def collab_params
    params.require(:collab).permit(
      Collab.attribute_names.map(&:to_sym),
    function_attributes: Function.attribute_names.map(&:to_sym).
  push(:destroy))
  end
end
