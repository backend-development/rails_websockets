class StepsController < ApplicationController
  before_action :set_step, only: [:update, :destroy]

  # POST /steps
  def create
    @step = Step.new(step_params)

    if @step.save
      redirect_to adventure_path(@step.stepstone.adventure), notice: 'You started working.'
    else
      render :new
    end
  end

  # PATCH/PUT /steps/1
  def update
    if @step.update(step_params)
      redirect_to adventure_path(@step.stepstone.adventure), notice: 'Step was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /steps/1
  def destroy
    @step.destroy
    redirect_to steps_url, notice: 'Step was successfully destroyed.'
  end

  private

  def set_step
    @step = Step.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def step_params
    params.require(:step).permit(:user_id, :stepstone_id, :aasm_state, :status)
  end
end
