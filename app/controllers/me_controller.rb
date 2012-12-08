class MeController < ApplicationController
  respond_to :json, :html

  def index
    data = {:current_user => current_user, :flash => flash.to_hash}

    if params[:verb] then
      data[params[:verb]] = params[:id].to_i
    end

    respond_to do |format|
      format.html 
      format.json { render json: data }
    end
  end

end
