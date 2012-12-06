class StepsController < ApplicationController
  before_filter :find_adventure
  before_filter :find_step, :only => [ :show, :edit, :update, :destroy ]

  # GET /steps
  # GET /steps.json
  def index
    @steps = @adventure.steps

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @steps }
    end
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    @step = Step.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/new
  # GET /steps/new.json
  def new
    @step = Step.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @step }
    end
  end

  # GET /steps/1/edit
  def edit
    @step = Step.find(params[:id])
  end

  # POST /steps
  # POST /steps.json
  def create
    params[:step][:adventure_id] = params[:adventure_id]
    @step = Step.new(params[:step])

    respond_to do |format|
      if @step.save
        format.html { redirect_to @adventure, notice: 'Step was successfully created.' }
        format.json { render json: @step, status: :created, location: @step }
      else
        format.html { render action: "new" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /steps/1
  # PUT /steps/1.json
  def update
    @step = Step.find(params[:id])
    params[:step][:adventure_id] = params[:adventure_id]

    respond_to do |format|
      if @step.update_attributes(params[:step])
        format.html { redirect_to @adventure, notice: 'Step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy

    respond_to do |format|
      format.html { redirect_to adventure_path( @adventure ) }
      format.json { head :no_content }
    end
  end

private

  def find_adventure
    @adventure = Adventure.find(params[:adventure_id])
  end 

  def find_step
    @step = Step.find(params[:id])
  end
end
