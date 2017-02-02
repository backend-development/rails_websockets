class AdventuresController < ApplicationController
  before_action :set_adventure,      only: [:show, :edit, :update, :reorder, :sort, :start, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :reorder, :sort, :create, :destroy]
  # GET /adventures
  def index
    @adventures = Adventure.all
  end

  # GET /adventures/1
  def show
    @statuses = Step.statuses
    @my_statuses = @adventure.statuses_of(current_user)
    @stepstones = @adventure.full_stepstones
  end

  # GET /adventures/new
  def new
    @adventure = Adventure.new
  end

  # GET /adventures/1/edit
  def edit
    @stepstones = @adventure.stepstones
  end

  # POST /adventures
  def create
    @adventure = Adventure.new(adventure_params)
    @adventure.owner = current_user

    if @adventure.save
      redirect_to edit_adventure_path(@adventure), notice: 'Adventure was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /adventures/1/sort
  def sort
    if current_user == @adventure.owner
      p = params.require(:adventure).permit(stepstone_order: [])
      @adventure.order_stepstones!(p[:stepstone_order])
    end
    head :ok
  end

  # PATCH/PUT /adventures/1/start
  def start
    @adventure.stepstones.each do |s|
      begin
        Rails.logger.warn("trying to create step for #{s} and #{current_user}")
        current_user.steps.create!(stepstone: s, status: 'not started')
      rescue
        Rails.logger.warn('got rolled back on step!')
      end
    end
    redirect_to adventure_path(@adventure)
  end

  # PATCH/PUT /adventures/1
  def update
    if @adventure.update(adventure_params)
      redirect_to adventures_url, notice: 'Adventure was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /adventures/1
  def destroy
    @adventure.destroy
    redirect_to adventures_url, notice: 'Adventure was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_adventure
    @adventure = Adventure.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def adventure_params
    params.require(:adventure).permit(:title, :description)
  end
end
