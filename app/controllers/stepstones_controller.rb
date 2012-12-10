class StepstonesController < ApplicationController
  before_filter :find_adventure
  before_filter :find_stepstone, :only => [ :show, :edit, :update, :destroy, :trans, :join ]
  before_filter :authenticate_user!, :only => [  :new, :create, :trans, :join ]


  # GET /stepstones
  # GET /stepstones.json
  def index
    @stepstones = @adventure.stepstones

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stepstones }
    end
  end

  # GET /stepstones/1
  # GET /stepstones/1.json
  def show
    @stepsteon = Stepstone.find(params[:id])
    if current_user then
      @current_step = @stepstone.steps.find_by_user_id( current_user.id )
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stepstone }
    end
  end

  # GET /stepstones/new
  # GET /stepstones/new.json
  def new
    @stepstone = Stepstone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stepstone }
    end
  end

  # GET /stepstones/1/edit
  def edit
    @stepstone = Stepstone.find(params[:id])
  end

  # POST /stepstones/:id/trans/:transition
  # POST /stepstones/:id/trans/:transition.json
  def trans
    @step = @stepstone.steps.find_by_user_id( current_user.id )
    raise "no such transition" unless Step.transitions.include? params[:transition]
    @step.fire_events( params[:transition]  )
    redirect_to adventure_stepstone_path( @adventure, @stepstone )
  end


  # POST /adventure/:id/stepstone/:stepstone_id/join
  # POST /adventure/:id/stepstone/:stepstone_id/join.json
  def join
    @stepstone.steps.create( :user_id => current_user.id )
    redirect_to adventure_stepstone_path(@adventure, @stepstone)
  end


  # POST /stepstones
  # POST /stepstones.json
  def create
    params[:stepstone][:adventure_id] = params[:adventure_id]
    @stepstone = Stepstone.new(params[:stepstone])

    respond_to do |format|
      if @stepstone.save
        format.html { redirect_to @adventure, notice: 'Step was successfully created.' }
        format.json { render json: @stepstone, status: :created, location: @stepstone }
      else
        format.html { render action: "new" }
        format.json { render json: @stepstone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stepstones/1
  # PUT /stepstones/1.json
  def update
    @stepstone = Stepstone.find(params[:id])
    params[:stepstone][:adventure_id] = params[:adventure_id]

    respond_to do |format|
      if @stepstone.update_attributes(params[:stepstone])
        format.html { redirect_to @adventure, notice: 'Step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stepstone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stepstones/1
  # DELETE /stepstones/1.json
  def destroy
    @stepstone.destroy

    respond_to do |format|
      format.html { redirect_to adventure_path( @adventure ) }
      format.json { head :no_content }
    end
  end

  private

  def find_adventure
    @adventure = Adventure.find(params[:adventure_id])
    raise "no such adventure" if @adventure.nil?
  end 

  def find_stepstone
    @stepstone = @adventure.stepstones.find(params[:id])
    raise "no such stepstone" if @stepstone.nil?
  end
end
