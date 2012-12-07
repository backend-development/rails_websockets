class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :keep_flash_on_html_requests
  
  
  def keep_flash_on_html_requests
    flash.keep if request.format.html?
  end
end
