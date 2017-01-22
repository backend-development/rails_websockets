class AdventuresController < ApplicationController
  before_action :set_adventure, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
  # GET /adventures
  def index
    @adventures = Adventure.all
  end

  # GET /adventures/1
  def show
  end

  # GET /adventures/new
  def new
    @adventure = Adventure.new
  end

  # GET /adventures/1/edit
  def edit
  end

  # POST /adventures
  def create
    @adventure = Adventure.new(adventure_params)
    @adventure.user = current_user

    if @adventure.save
      redirect_to @adventure, notice: 'Adventure was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /adventures/1
  def update
    if @adventure.update(adventure_params)
      redirect_to @adventure, notice: 'Adventure was successfully updated.'
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
