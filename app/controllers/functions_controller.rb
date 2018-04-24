class FunctionsController < ApplicationController
  before_action :set_function, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @functions = Function.all
  end

  def new
    @function = Function.new
  end

  def create
    @function = Function.new(function_params)
    if @function.valid?
      @function.save
      redirect_to function_path(@function),
        notice: 'Function was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @function.valid?
      @function.update(function_params)
      redirect_to function_path(@function),
        notice: 'Function was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @function.destroy
    redirect_to functions_path,
      notice: 'Function was successfully destroyed.'
  end

  def set_function
    @function = Function.find(params[:id])
  end

  def function_params
    params.require(:function).permit(Function.attribute_names.map(&:to_sym))
  end
end
