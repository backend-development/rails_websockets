class StepstonesController < ApplicationController
  before_action :set_adventure
  before_action :set_stepstone, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]

  # GET /stepstones
  def index
    @stepstones = @adventure.stepstones
  end

  # GET /stepstones/1
  def show
  end

  # GET /stepstones/new
  def new
    @stepstone = @adventure.stepstones.new
  end

  # GET /stepstones/1/edit
  def edit
  end

  # POST /stepstones
  def create
    @stepstone = @adventure.stepstones.build(stepstone_params)

    if @stepstone.save
      redirect_to adventure_stepstones_url(@adventure), notice: 'Stepstone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stepstones/1
  def update
    if @stepstone.update(stepstone_params)
      redirect_to adventure_stepstone_url(@adventure, @stepstone), notice: 'Stepstone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stepstones/1
  def destroy
    @stepstone.destroy
    redirect_to adventure_stepstones_url(@adventure), notice: 'Stepstone was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_adventure
    @adventure = Adventure.find(params[:adventure_id])
  end

  def set_stepstone
    @stepstone = @adventure.stepstones.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def stepstone_params
    params.require(:stepstone).permit(:description)
  end
end
