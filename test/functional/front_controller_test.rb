require 'test_helper'

class FrontControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    get :index
    assert_response :success
  end

end
