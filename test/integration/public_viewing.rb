require 'integration_test_helper'

class PublicViewingTest < ActionDispatch::IntegrationTest

  test "Homepage is displayed" do
    a = Adventure.create!(:title => "Write a Rails App", :description => "the biggest adventure ever")
    visit "/"
    assert page.has_content?('Stepstones')
    assert page.has_content?('Write a Rails App')

    assert page.has_link? "Adventures", adventures_path
    assert page.has_content?('To login you need Javascript')
  end


end

