class SessionsController < ApplicationController
  def login_for_testing
    session[:user_id] = User.first.id
    redirect_to root_path, notice: 'Logged in'
  end

  def create
    user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])

    if user
      session[:user_id] = user.id
      session[:access_token] = user.token
      redirect_to root_path, notice: 'Logged in'
    else
      redirect_to login_path, alert: 'Log in failed'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_path, notice: 'Logged out'
  end

  def failure
    render json: params.to_json
  end
end
