class MeController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html 
      format.json { render json: {:current_user => current_user, :flash => flash.to_hash} }
    end
  end

end
