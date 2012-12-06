class FrontController < ApplicationController
  def index
    @current_adventures = Adventure.current
  end
end
