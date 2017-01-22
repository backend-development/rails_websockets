class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.where(id: session[:user_id]).first
    end
  end
  helper_method :current_user

  def user_signed_in?
    not current_user.nil?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    unless current_user
      redirect_to root_path, notice: 'permission denied, only for logged in users'
    end
  end
  helper_method :authenticate_user!

end
