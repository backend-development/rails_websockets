class FrontController < ApplicationController
  def index
    @current_adventures = Adventure.current
    @no_users = Adventure.current_users
  end
end
