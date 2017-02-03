require 'test_helper'

class WorkThroughAnAdventureTest < Capybara::Rails::TestCase
  def assert_permission_denied
    assert_content('permission denied')
  end

  test 'guest cannot start an adventure' do
    visit adventure_path(adventures(:one))
    assert_content('This Adventure consists of 3 steps')
    assert_content('Log in to start this adventure')
  end

  test 'signed in user can start an adventure' do
    visit auth_testing_path(id: users(:three).id)
    visit adventure_path(adventures(:one))
    assert_content('This Adventure consists of 3 steps')
    within('.step_0') do
      click_button('Working')
    end
    assert_content('You are working on this adventure')
  end
end
