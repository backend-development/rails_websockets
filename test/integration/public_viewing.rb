require 'integration_test_helper'

class PublicViewingTest < ActionDispatch::IntegrationTest

  test "Homepage is displayed" do
    a = Adventure.create!(:title => "Write a Rails App", :description => "the biggest adventure ever")
    visit "/"
    assert page.has_content?('Stepstones')
    assert page.has_content?('Write a Rails App')

    assert page.has_link? "Adventures", adventures_path
    assert page.has_link? "Sign Up", new_user_registration_path
    assert page.has_link? "Login", new_user_session_path
  end


end

